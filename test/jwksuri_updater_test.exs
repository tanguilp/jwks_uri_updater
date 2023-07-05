defmodule JWKSURIUpdaterTest do
  use ExUnit.Case

  @payload %{
    "keys" => [
      %{
        "e" => "AQAB",
        "kid" => "Lf6HnQSgDflrOSTrlf0WFQRuGTYkdCifTul7XZS6cqI",
        "kty" => "RSA",
        "n" =>
          "omYM7w_NUw6U8i8-RD5HkxokdnaUVbS3RGwzUkuMCcTu7Xw6UIWiYsCPV2djC37JIzk1Q2KzKMMbnXDNiqXl_wdM74PvA8J8x4OYgGG62r9lceWKTW42PshnjKDrbI_9jRD68YTmDq5rJt5bfsy9WuSGU6NmAue6h-2dzeFrLFWnFM8NZbEhkJ4KZwQ0o8-Ww-dytrSwH91X6MlO8mDLZWrOO3bw5I5Osv5nR1S8wQPp3zyTPN20vWhDmO7DmIS6BwZdVuo9F3Pmpqo1sZAfO8j3RD15F_6fDq8TQfaTMEePr2RNqYj6QNnUYfDTT3SK-2c2GF6KoYGIi142zGEtJw",
        "use" => "sig"
      }
    ]
  }

  setup_all do
    Tesla.Mock.mock_global(fn
      %{method: :get, url: "https://example.com/keys/valid_payload"} ->
        %Tesla.Env{status: 200, body: @payload}

      %{method: :get, url: "https://example.com/keys/invalid_payload"} ->
        %Tesla.Env{status: 200, body: @payload["keys"]}

      %{method: :get, url: "https://example.com/keys/invalid_format"} ->
        %Tesla.Env{status: 200, body: "invalid=yes"}

      %{method: :get, url: "https://example.com/invalid_uri"} ->
        %Tesla.Env{status: 404, body: nil}
    end)

    :ok
  end

  test "valid payload returns keys" do
    assert {:ok, keys} = JWKSURIUpdater.get_keys("https://example.com/keys/valid_payload")
    assert keys == @payload["keys"]
  end

  test "invalid JSON payload returns an error" do
    assert {:error, reason} = JWKSURIUpdater.get_keys("https://example.com/keys/invalid_payload")
    assert is_atom(reason)
  end

  test "invalid URL-encoded payload returns an error" do
    assert {:error, reason} = JWKSURIUpdater.get_keys("https://example.com/keys/invalid_format")
    assert is_atom(reason)
  end

  test "invalid URL returns an error" do
    assert {:error, reason} = JWKSURIUpdater.get_keys("https://example.com/invalid_uri")
    assert is_atom(reason)
  end
end
