defmodule JWKSURIUpdater do
  @moduledoc """
  JWKSURIUpdater dynamically loads jwks URIs keys (lazy-loading) and keeps it in memory for
  further access.

  The `get_keys/2` function can be called with the following options:
  - `refresh_interval`: the number of seconds to keep keys unchanged in cache before it is
  fetched again. Defaults to `3600` seconds
  - `min_refresh_interval`: the delay before JWKSURIUpdater will try to fetch keys of a
  jwks_uri again. It is intended to prevent fetching storms when the keys are unavailable.
  Defaults to `10` seconds
  - `on_refresh_failure`: determines the behaviour of JWKSURIUpdater when the keys *become*
  unavailable: `:keep_keys` will keep the keys in the cache, `:discard` will delete them.
  Defaults to `:discard`

  ## Deviation from the specifications

  From [RFC7517](https://tools.ietf.org/html/rfc7517#section-5):
  - due to the behaviour of the `Poison.decode/1` function, the first (and not the last) `"keys"`
  will be returned:

  > The member names within a JWK Set MUST be unique; JWK Set parsers
  > MUST either reject JWK Sets with duplicate member names or use a JSON
  > parser that returns only the lexically last duplicate member name, as
  > specified in Section 15.12 ("The JSON Object") of ECMAScript 5.1
  > [ECMAScript].
  """

  @doc """
  Returns `{:ok, [map()]}` containing the keys, or `{:error, error}` if they could not be
  retrieved or if validation failed.

  ## Examples
  ```elixir
  iex> JWKSURIUpdater.get_keys("https://www.googleapis.com/oauth2/v3/certs")
  {:ok,
   [
     %{
       "alg" => "RS256",
       "e" => "AQAB",
       "kid" => "84f294c45160088d079fee68138f52133d3e228c",
       "kty" => "RSA",
       "n" => "iyzj9wpDDZLCbgbr2zKv3bs8zqjflcVEd7PYMjKGYpoaY2LdqfjFxrwTqd9Ea4m3NIR2giOx9JLQhtqqSSpBJpBBpHmaEd2FCPwd4GQTKJurEP6Ho9HWAuRTMhs8W04pd__HQ0Bc22AEamieGLtzcYfIaAc9g5RCxZdRVbGK0Z0vSOAwN1PC_S76nWGphouHukU40EiwjqC-D9G2xYFbKNb0_NJMxJ5UCenN85FjEii5-oW0wCBmt_1Sr76Q_e0INxfGu6dRf0vGXPvqxkINz2knjl9ec2SvOK2hnmRN4O9zToKH70_DBrsZE0ePDScTOWPHJU2wOyE6gzkL6FdaFQ",
       "use" => "sig"
     },
     %{
       "alg" => "RS256",
       "e" => "AQAB",
       "kid" => "df3758908b792293ad977a0b991d98a77f4eeecd",
       "kty" => "RSA",
       "n" => "or_VvOWtrHVCX7Dw_9gMsLu0TXtWC1l00mYNoTN2H52cw3hq5kpjJHrLcCjsbvIpdopEix3xGzSD3XryoHbHUi5sqk2teEhg_GkNWcMUmtjd--PKfowvidfrqdi_g9YFsH9kgXzdwcfA10ft0lWc6JFXy3CGhgqgs4z_qf54fTWZniMjn4qE0PGpzIwubVhs13b31qlHKoRuJ8Se82nMBGsGZGFTU5GY2gbkhPgFY-kIktB-XV2vyi7fWhO9wFL4r30DiVbwa3zGWNav_mztGUHlaiMaBjz35-RxXdGzvYsVYJIUavBUCqqHhcpw_XS0_Et0PlUo6vQCl0Y_EXmf6Q",
       "use" => "sig"
     }
   ]}
  iex> JWKSURIUpdater.get_keys("https://auth.login.yahoo.co.jp/yconnect/v2/jwks")
  {:ok,
   [
     %{
       "alg" => "RS256",
       "e" => "AQAB",
       "kid" => "0cc175b9c0f1b6a831c399e269772661",
       "kty" => "RSA",
       "n" => "0bXcnrheJ2snfq1wv6Qz8-TEPDGKHCM0SsrQjxEFpXSEycL2_A-oW1ZGUzCuhz4HH4wkvc4CDJl25johSIUTVyo4mrFrJ0ab0QAhrWE7gMyWFIfraj9cksPAGyVAiXLCN9Ly2xuoJxFjCAZXw1VO8i7RTYK8ZP6dhcosiyzdhYt7C_65B5ikmCS4AymXIa83QQanCtjoGiwy4Cf2pLnn9zXMZEnqQ-wwSoGn32YExmap7GAtjOwHNWU5zpW3dwNMq-zkcln3ICEBwxDpWJhEZHZPBpPWgN-dQZDR2FiGHJgUFE3EM-CIcwxekrRBP-R3xEUeMFf5z1HeQNK8sjZeRw",
       "use" => "sig"
     },
     %{
       "alg" => "RS256",
       "e" => "AQAB",
       "kid" => "b0c88084cd7ced792748340968b7d689",
       "kty" => "RSA",
       "n" => "xf9qYN87qbnuzKZFLM756UZXhBZuaB7g8l-jBeQsf2Suf6QUC1A_v30Y4yC0Jht_D5M3RzGzRxvPfBRnKm3NxUDV5Ihmunt3-ZW6ia3bNdd7RRgCj3HdtQRiVroa9nDj_8abXZA1n2v2RpfiJKSoHR8fim2TmfM7EMqXaoe65l1P3drEUkRMAOCMnsCXxCEfpcw_z0tXVTuOI_w3aCI8D3mfPe2fTmCUOiYLV4jhnF5-pMZEBcF4_RsYTdKg_50F4hhgQ0qpkFJ2UI_UMV6tHKw0lSJefcwj5j_pfeW4kfutUjb0xPQ2VrJ5IPM-efF5wtlkIhhQE58U5XuhWnc6Iw",
       "use" => "sig"
     }
   ]}
  ```
  """

  defdelegate get_keys(jwks_uri, opts \\ []), to: JWKSURIUpdater.Updater
end
