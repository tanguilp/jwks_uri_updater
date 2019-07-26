# JWKSURIUpdater

JWKS URI key updater

## Installation

```elixir
def deps do
  [
    {:jwks_uri_updater, github: "tanguilp/jwks_uri_updater", tag: "v0.1.1"}
  ]
end
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
{:error, %HTTPoison.Error{id: nil, reason: :econnrefused}}
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
```
