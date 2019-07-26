defmodule JWKSURIUpdater do
  @moduledoc """
  Documentation for JWKSURIUpdater.
  """

  defdelegate get_keys(jwks_uri, opts \\ []), to: JWKSURIUpdater.Updater
end
