defmodule JWKSURIUpdater.Updater do
  use GenServer

  require Logger

  @default_opts [
    refresh_interval: 3600,
    min_refresh_interval: 10,
    on_refresh_failure: :discard,
    ssl: []
  ]

  @table_name :jwks_uri_keys

  @process_name :jwks_uri_updater

  # client API
  def start_link(_) do
    GenServer.start_link(__MODULE__, [], name: @process_name)
  end

  @doc """
  Return the keys
  """

  @spec get_keys(String.t, Keyword.t) :: {:ok, [map()]} | {:error, atom()}

  def get_keys(jwks_uri, opts) do
    opts = Keyword.merge(@default_opts, opts)

    update_res =
      unless keys_up_to_date?(jwks_uri, opts) do
        GenServer.call(@process_name, {:update_keys, jwks_uri, opts})
      end

    case update_res do
      {:error, e} ->
        {:error, e}

      _ ->
        case :ets.lookup(@table_name, jwks_uri) do
          [{_jwks_uri, _last_update_time, keys}] ->
            {:ok, keys || []}

          [{_jwks_uri, _last_update_time, {:error, error}}] ->
            {:error, error}
        end
    end
  end

  defp keys_up_to_date?(jwks_uri, opts) do
    case :ets.lookup(@table_name, jwks_uri) do
      [{_jwks_uri, last_update_time, {:error, _}}] ->
        if now() - last_update_time < opts[:min_refresh_interval], do: true, else: false

      [{_jwks_uri, last_update_time, _keys}] ->
        if now() - last_update_time < opts[:refresh_interval], do: true, else: false

      _ -> false
    end
  end

  # server callbacks

  @impl true

  def init(_opts) do
    HTTPoison.start()

    :ets.new(@table_name, [:set, :named_table, :protected, read_concurrency: true])

    unless is_nil(Application.get_env(:jwks_uri_updater, :preload)) do
      Enum.each(Application.get_env(:jwks_uri_updater, :preload),
                fn
                  {jwks_uri, opts} ->
                    GenServer.call(@process_name, {:update_keys, jwks_uri, opts})
                end)
    end

    {:ok, %{}}
  end

  @doc """
  """

  @impl true
  def handle_call({:update_keys, jwks_uri, opts}, _from, state) do
    # the metadata may have already been updated but the HTTP request
    # was in-flight and that method called meanwhile
    if keys_up_to_date?(jwks_uri, opts) do
      {:reply, :ok, state}
    else
      case request_and_process_keys(jwks_uri, opts) do
        {:ok, keys} ->
          :ets.insert(@table_name, {jwks_uri, now(), keys})

          {:reply, :ok, state}

        {:error, error} ->
          on_refresh_failure = opts[:on_refresh_failure]

          case :ets.lookup(@table_name, jwks_uri) do
            [{_uri, _last_update_time, keys}] when not is_nil keys
              and on_refresh_failure == :keep_metadata ->
              :ets.update_element(@table_name, jwks_uri, {2, now()})

              Logger.warn("#{__MODULE__}: keys for uri #{jwks_uri} can no longer be reached")

              {:reply, :ok, state}
            _ ->
              :ets.insert(@table_name, {jwks_uri, now(), {:error, error}})

              {:reply, {:error, error}, state}
          end
      end
    end
  end

  defp request_and_process_keys(jwks_uri, opts) do
    with :ok <- https_scheme?(jwks_uri),
         {:ok, %HTTPoison.Response{body: body, status_code: 200}} <-
           HTTPoison.get(jwks_uri, [], hackney: [ssl_options: opts[:ssl]]),
         {:ok, key_set} <- Poison.decode(body) do
           case key_set do
             %{"keys" => keys} when is_list(keys) ->
               {:ok, keys}

              _ ->
                {:error, :no_keys_parameter}
           end
    else
      {:ok, %HTTPoison.Response{}} ->
        {:error, :invalid_http_response_code}

      {:error, error} ->
        {:error, error}
    end
  end

  defp https_scheme?(jwks_uri) do
    case URI.parse(jwks_uri) do
      %URI{scheme: "https"} ->
        :ok

      _ ->
        {:error, :not_https_scheme}
    end
  end

  defp now(), do: System.system_time(:second)
end
