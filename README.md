# JWKSURIUpdater

JWKS URI key updater

## Installation

```elixir
def deps do
  [
    {:jwks_uri_updater, "~> 1.1"},
    {:hackney, "~> 1.0"}
  ]
end
```

The hackney dependency is used as the default adapter for Tesla. Another one can be used
instead (see
[https://github.com/teamon/tesla#adapters](https://github.com/teamon/tesla#adapters)) and then
has to be configured in your `config.exs`:

```elixir
config :tesla, adapter: Tesla.Adapter.AnotherOne
```

## Usage

```elixir
iex> JWKSURIUpdater.get_keys("https://nexus.passport.com/public/partner/discovery/key")
{:ok,
 [
   %{
     "e" => "AQAB",
     "kid" => "1LTMzakihiRla_8z2BEJVXeWMqo",
     "kty" => "RSA",
     "n" => "3sKcJSD4cHwTY5jYm5lNEzqk3wON1CaARO5EoWIQt5u-X-ZnW61CiRZpWpfhKwRYU153td5R8p-AJDWT-NcEJ0MHU3KiuIEPmbgJpS7qkyURuHRucDM2lO4L4XfIlvizQrlyJnJcd09uLErZEO9PcvKiDHoois2B4fGj7CsAe5UZgExJvACDlsQSku2JUyDmZUZP2_u_gCuqNJM5o0hW7FKRI3MFoYCsqSEmHnnumuJ2jF0RHDRWQpodhlAR6uKLoiWHqHO3aG7scxYMj5cMzkpe1Kq_Dm5yyHkMCSJ_JaRhwymFfV_SWkqd3n-WVZT0ADLEq0RNi9tqZ43noUnO_w",
     "use" => "sig",
     "x5c" => ["MIIDYDCCAkigAwIBAgIJAIB4jVVJ3BeuMA0GCSqGSIb3DQEBCwUAMCkxJzAlBgNVBAMTHkxpdmUgSUQgU1RTIFNpZ25pbmcgUHVibGljIEtleTAeFw0xNjA0MDUxNDQzMzVaFw0yMTA0MDQxNDQzMzVaMCkxJzAlBgNVBAMTHkxpdmUgSUQgU1RTIFNpZ25pbmcgUHVibGljIEtleTCCASIwDQYJKoZIhvcNAQEBBQADggEPADCCAQoCggEBAN7CnCUg+HB8E2OY2JuZTRM6pN8DjdQmgETuRKFiELebvl/mZ1utQokWaVqX4SsEWFNed7XeUfKfgCQ1k/jXBCdDB1NyoriBD5m4CaUu6pMlEbh0bnAzNpTuC+F3yJb4s0K5ciZyXHdPbixK2RDvT3Lyogx6KIrNgeHxo+wrAHuVGYBMSbwAg5bEEpLtiVMg5mVGT9v7v4ArqjSTOaNIVuxSkSNzBaGArKkhJh557pridoxdERw0VkKaHYZQEerii6Ilh6hzt2hu7HMWDI+XDM5KXtSqvw5ucsh5DAkifyWkYcMphX1f0lpKnd5/llWU9AAyxKtETYvbameN56FJzv8CAwEAAaOBijCBhzAdBgNVHQ4EFgQU9IdLLpbC2S8Wn1MCXsdtFac9SRYwWQYDVR0jBFIwUIAU9IdLLpbC2S8Wn1MCXsdtFac9SRahLaQrMCkxJzAlBgNVBAMTHkxpdmUgSUQgU1RTIFNpZ25pbmcgUHVibGljIEtleYIJAIB4jVVJ3BeuMAsGA1UdDwQEAwIBxjANBgkqhkiG9w0BAQsFAAOCAQEAXk0sQAib0PGqvwELTlflQEKS++vqpWYPW/2gCVCn5shbyP1J7z1nT8kE/ZDVdl3LvGgTMfdDHaRF5ie5NjkTHmVOKbbHaWpTwUFbYAFBJGnx+s/9XSdmNmW9GlUjdpd6lCZxsI6888r0ptBgKINRRrkwMlq3jD1U0kv4JlsIhafUIOqGi4+hIDXBlY0F/HJPfUU75N885/r4CCxKhmfh3PBM35XOch/NGC67fLjqLN+TIWLoxnvil9m3jRjqOA9u50JUeDGZABIYIMcAdLpI2lcfru4wXcYXuQul22nAR7yOyGKNOKULoOTE4t4AeGRqCogXSxZgaTgKSBhvhE+MGg=="],
     "x5t" => "1LTMzakihiRla_8z2BEJVXeWMqo"
   },
   %{
     "e" => "AQAB",
     "kid" => "xP_zn6I1YkXcUUmlBoPuXTGsaxk",
     "kty" => "RSA",
     "n" => "2pWatafeb3mB0A73-Z-URwrubwDldWvivRu19GNC61MBOb3fZ4I4lyhUhNuS7aJRPJIFB6zl-HFx1nHpGg74BHe0z9skODHYZEACd2iKBIet55DdduIe1CXsZ9keyEmNaGv3XS4OW_7IDM0j5wR9OHugUifkH3PQIcFvTYanHmXojTmgjIOWoz7y0okpyN9-FbZRzdfx-ej-njaj5gR8r69muwO5wlTbIG20V40R6zYh-QODMUpayy7jDGFGw5vjFH9Ca0tLZcNQq__JKE_mp-0fODOAQobOrBUoASFkyCd95BVW7KJrndvW7ofRWaCTuZZOy5SnU4asbjMrgxFZFw",
     "use" => "sig",
     "x5c" => ["MIIDYDCCAkigAwIBAgIJAJzCyTLC+DjJMA0GCSqGSIb3DQEBCwUAMCkxJzAlBgNVBAMTHkxpdmUgSUQgU1RTIFNpZ25pbmcgUHVibGljIEtleTAeFw0xNjA3MTMyMDMyMTFaFw0yMTA3MTIyMDMyMTFaMCkxJzAlBgNVBAMTHkxpdmUgSUQgU1RTIFNpZ25pbmcgUHVibGljIEtleTCCASIwDQYJKoZIhvcNAQEBBQADggEPADCCAQoCggEBANqVmrWn3m95gdAO9/mflEcK7m8A5XVr4r0btfRjQutTATm932eCOJcoVITbku2iUTySBQes5fhxcdZx6RoO+AR3tM/bJDgx2GRAAndoigSHreeQ3XbiHtQl7GfZHshJjWhr910uDlv+yAzNI+cEfTh7oFIn5B9z0CHBb02Gpx5l6I05oIyDlqM+8tKJKcjffhW2Uc3X8fno/p42o+YEfK+vZrsDucJU2yBttFeNEes2IfkDgzFKWssu4wxhRsOb4xR/QmtLS2XDUKv/yShP5qftHzgzgEKGzqwVKAEhZMgnfeQVVuyia53b1u6H0Vmgk7mWTsuUp1OGrG4zK4MRWRcCAwEAAaOBijCBhzAdBgNVHQ4EFgQU11z579/IePwuc4WBdN4L0ljG4CUwWQYDVR0jBFIwUIAU11z579/IePwuc4WBdN4L0ljG4CWhLaQrMCkxJzAlBgNVBAMTHkxpdmUgSUQgU1RTIFNpZ25pbmcgUHVibGljIEtleYIJAJzCyTLC+DjJMAsGA1UdDwQEAwIBxjANBgkqhkiG9w0BAQsFAAOCAQEAiASLEpQseGNahE+9f9PQgmX3VgjJerNjXr1zXWXDJfFE31DxgsxddjcIgoBL9lwegOHHvwpzK1ecgH45xcJ0Z/40OgY8NITqXbQRfdgLrEGJCoyOQEbjb5PW5k2aOdn7LBxvDsH6Y8ax26v+EFMPh3G+xheh6bfoIRSK1b+44PfoDZoJ9NfJibOZ4Cq+wt/yOvpMYQDB/9CNo18wmA3RCLYjf2nAc7RO0PDYHSIq5QDWV+1awmXDKgIdRpYPpRtn9KFXQkpCeEc/lDTG+o6n7nC40wyjioyR6QmHGvNkMR4VfSoTKCTnFATyDpI1bqU2K7KNjUEsCYfwybFB8d6mjQ=="],
     "x5t" => "xP_zn6I1YkXcUUmlBoPuXTGsaxk"
   }
 ]}
iex> JWKSURIUpdater.get_keys("https://www.example.com/bad_uri")
{:error, :invalid_http_response_code}
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
iex> JWKSURIUpdater.get_keys("https://login.microsoftonline.com/common/discovery/keys", tesla_middlewares: [Tesla.Middleware.Logger])

20:46:22.711 [info]  GET https://login.microsoftonline.com/common/discovery/keys -> 200 (296.234 ms)
{:ok,
 [
   %{
     "e" => "AQAB",
     "kid" => "HlC0R12skxNZ1WQwmjOF_6t_tDE",
     "kty" => "RSA",
     "n" => "vq_3TOSbrUzpGPHFEwjmeoE_Zu3-wU4vaeEvjQzUHXwIefy8bDuMav6OzUiEXhjLX5JRkGhds3lNGR3CSZgartIKWv5Vrc7F2YcBcgzrpO06kVcewRMjdhrPYfUfO6QklAOSCcPq4RUhEvkGEwbAw3awclve1KuhpX6fOIInP8Gp8hrFDd_neBR3AY03JrZpezBdQoE24UHgAlHGb2UZ2KKjl3rLDMPh9HecjTiga3SbdcrhTAOYHYb4LwCSrThrHSyZFBxzTwQMS0NEyKV7_-ADrFunf9cuVcGpQZkvdwODl4tY-l2sd3WpoD_gMDpoFJVojjzF07ovrfntM4o8Bw",
     "use" => "sig",
     "x5c" => ["MIIDBTCCAe2gAwIBAgIQGb5LYbKo3IdM0HQsjv+mEjANBgkqhkiG9w0BAQsFADAtMSswKQYDVQQDEyJhY2NvdW50cy5hY2Nlc3Njb250cm9sLndpbmRvd3MubmV0MB4XDTE5MTIyNjAwMDAwMFoXDTI0MTIyNTAwMDAwMFowLTErMCkGA1UEAxMiYWNjb3VudHMuYWNjZXNzY29udHJvbC53aW5kb3dzLm5ldDCCASIwDQYJKoZIhvcNAQEBBQADggEPADCCAQoCggEBAL6v90zkm61M6RjxxRMI5nqBP2bt/sFOL2nhL40M1B18CHn8vGw7jGr+js1IhF4Yy1+SUZBoXbN5TRkdwkmYGq7SClr+Va3OxdmHAXIM66TtOpFXHsETI3Yaz2H1HzukJJQDkgnD6uEVIRL5BhMGwMN2sHJb3tSroaV+nziCJz/BqfIaxQ3f53gUdwGNNya2aXswXUKBNuFB4AJRxm9lGdiio5d6ywzD4fR3nI04oGt0m3XK4UwDmB2G+C8Akq04ax0smRQcc08EDEtDRMile//gA6xbp3/XLlXBqUGZL3cDg5eLWPpdrHd1qaA/4DA6aBSVaI48xdO6L6357TOKPAcCAwEAAaMhMB8wHQYDVR0OBBYEFMGZU4IfHXk8nigJzTMM45KzMjeVMA0GCSqGSIb3DQEBCwUAA4IBAQAMJF5kk0gj119v4wbQTr9sQr9SS7ALfmIBQaeWjWRZvmXbEnMMA46y9nShV+d3cFrIrxuz7ynd3PU0+2HP4217VHO3rFyNbNnp4IB+BJa+hW/Hi54X+m/QPztDFCdiP1zYWr7DNEvnebuAMAJ+W0I08h5yIcX6Z0TTZcrWc72Qyi2Y2MuYDN+AVvQ1WZWsU4gbnUK7oj8bYnLfzWWuhfks2vC5Sbx9+79j+36HtsQnYe9ouxQ5vfNxm7wcLTQQulU16lnD0yObvr1hfteKfuW2/Ynoy5Z2ntIyCbGxiulaPLrFTW4gUhYgnteB5CwGw1C5vhv0Aa+XZouHVhoOLhWF"],
     "x5t" => "HlC0R12skxNZ1WQwmjOF_6t_tDE"
   },
   %{
     "e" => "AQAB",
     "kid" => "YMELHT0gvb0mxoSDoYfomjqfjYU",
     "kty" => "RSA",
     "n" => "ni9SAyu9EsltQlV7Jo3wMUvcpYb4mmfHzV4IsDZ6NQvJjtQJuhsfqiG86VntMd76R44kCmkfMGvtQRA2_UmnVBSSLxQKvcGUqNodH7YaMYOTmHlbOSoVpi3Ox2wj6cWvhaTTm_4xzJ3F0yF0Y_aRBMxSCIwLv3nTMRNe74k4zdBnhL7k5ObOY_vUGt_5-sPo6BXoV7oov4Ps6jeyUdRKtqVZSp5_kzz16kPh1Ng_2tn4vpQimNbHRralq8rNM_gOLPAar6v7mL_qsqpgx-48e5ENFxikbB-NzAmLll1QSkzciu2rCjFGH4j_-bCHr7FxUNDL_E0vMFVDFw8SUlYMgQ",
     "use" => "sig",
     "x5c" => ["MIIDBTCCAe2gAwIBAgIQG4GFMDOjD7lKSdsgshqQ/DANBgkqhkiG9w0BAQsFADAtMSswKQYDVQQDEyJhY2NvdW50cy5hY2Nlc3Njb250cm9sLndpbmRvd3MubmV0MB4XDTIwMDIwNTAwMDAwMFoXDTI1MDIwNDAwMDAwMFowLTErMCkGA1UEAxMiYWNjb3VudHMuYWNjZXNzY29udHJvbC53aW5kb3dzLm5ldDCCASIwDQYJKoZIhvcNAQEBBQADggEPADCCAQoCggEBAJ4vUgMrvRLJbUJVeyaN8DFL3KWG+Jpnx81eCLA2ejULyY7UCbobH6ohvOlZ7THe+keOJAppHzBr7UEQNv1Jp1QUki8UCr3BlKjaHR+2GjGDk5h5WzkqFaYtzsdsI+nFr4Wk05v+McydxdMhdGP2kQTMUgiMC7950zETXu+JOM3QZ4S+5OTmzmP71Brf+frD6OgV6Fe6KL+D7Oo3slHUSralWUqef5M89epD4dTYP9rZ+L6UIpjWx0a2pavKzTP4DizwGq+r+5i/6rKqYMfuPHuRDRcYpGwfjcwJi5ZdUEpM3IrtqwoxRh+I//mwh6+xcVDQy/xNLzBVQxcPElJWDIECAwEAAaMhMB8wHQYDVR0OBBYEFHssLV3w8SFEdZk03/TJwDfWQ6mRMA0GCSqGSIb3DQEBCwUAA4IBAQAh9iGtY+wKAMrYYLCU8uRZnUY9f+s936HhZdnJfVCuJM7y3fIbzvPO0T0dMHLz++ba0rkptoe+HjZaNA7vVwzdEtAdNff0wFef470sb+kxPi64PZK/IhtqBEwEvy090ZwGsZqM/Ut9QxFH21/t/wcz0wUBc6QGGxgWr1T/Qfzlemnz5DxuHaKQdiafz6yrwGyVjmaRkjMqeqhQy3J0nNoJNbofopSnnGH0g5IWBJBJPBk7k8RaliY0i+GwTliCgiI59ZPt1dS1+EXfNS06v1+TjTe1tPHyGot03i+iIA3WJk3REgT14y7Rhl94htzmMFmrlGNioXlfLFx9fDJQkJfz"],
     "x5t" => "YMELHT0gvb0mxoSDoYfomjqfjYU"
   },
   %{
     "e" => "AQAB",
     "kid" => "M6pX7RHoraLsprfJeRCjSxuURhc",
     "kty" => "RSA",
     "n" => "xHScZMPo8FifoDcrgncWQ7mGJtiKhrsho0-uFPXg-OdnRKYudTD7-Bq1MDjcqWRf3IfDVjFJixQS61M7wm9wALDj--lLuJJ9jDUAWTA3xWvQLbiBM-gqU0sj4mc2lWm6nPfqlyYeWtQcSC0sYkLlayNgX4noKDaXivhVOp7bwGXq77MRzeL4-9qrRYKjuzHfZL7kNBCsqO185P0NI2Jtmw-EsqYsrCaHsfNRGRrTvUHUq3hWa859kK_5uNd7TeY2ZEwKVD8ezCmSfR59ZzyxTtuPpkCSHS9OtUvS3mqTYit73qcvprjl3R8hpjXLb8oftfpWr3hFRdpxrwuoQEO4QQ",
     "use" => "sig",
     "x5c" => ["MIIC8TCCAdmgAwIBAgIQfEWlTVc1uINEc9RBi6qHMjANBgkqhkiG9w0BAQsFADAjMSEwHwYDVQQDExhsb2dpbi5taWNyb3NvZnRvbmxpbmUudXMwHhcNMTgxMDE0MDAwMDAwWhcNMjAxMDE0MDAwMDAwWjAjMSEwHwYDVQQDExhsb2dpbi5taWNyb3NvZnRvbmxpbmUudXMwggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIBAQDEdJxkw+jwWJ+gNyuCdxZDuYYm2IqGuyGjT64U9eD452dEpi51MPv4GrUwONypZF/ch8NWMUmLFBLrUzvCb3AAsOP76Uu4kn2MNQBZMDfFa9AtuIEz6CpTSyPiZzaVabqc9+qXJh5a1BxILSxiQuVrI2BfiegoNpeK+FU6ntvAZervsxHN4vj72qtFgqO7Md9kvuQ0EKyo7Xzk/Q0jYm2bD4SypiysJoex81EZGtO9QdSreFZrzn2Qr/m413tN5jZkTApUPx7MKZJ9Hn1nPLFO24+mQJIdL061S9LeapNiK3vepy+muOXdHyGmNctvyh+1+laveEVF2nGvC6hAQ7hBAgMBAAGjITAfMB0GA1UdDgQWBBQ5TKadw06O0cvXrQbXW0Nb3M3h/DANBgkqhkiG9w0BAQsFAAOCAQEAI48JaFtwOFcYS/3pfS5+7cINrafXAKTL+/+he4q+RMx4TCu/L1dl9zS5W1BeJNO2GUznfI+b5KndrxdlB6qJIDf6TRHh6EqfA18oJP5NOiKhU4pgkF2UMUw4kjxaZ5fQrSoD9omjfHAFNjradnHA7GOAoF4iotvXDWDBWx9K4XNZHWvD11Td66zTg5IaEQDIZ+f8WS6nn/98nAVMDtR9zW7Te5h9kGJGfe6WiHVaGRPpBvqC4iypGHjbRwANwofZvmp5wP08hY1CsnKY5tfP+E2k/iAQgKKa6QoxXToYvP7rsSkglak8N5g/+FJGnq4wP6cOzgZpjdPMwaVt5432GA=="],
     "x5t" => "M6pX7RHoraLsprfJeRCjSxuURhc"
   }
 ]}
```
