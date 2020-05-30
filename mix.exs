defmodule JWKSURIUpdater.MixProject do
  use Mix.Project

  def project do
    [
      app: :jwks_uri_updater,
      description: "JWKS URI key updater",
      version: "1.0.1",
      elixir: "~> 1.9",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      docs: [
        main: "readme",
        extras: ["README.md"]
      ],
      package: package(),
      source_url: "https://github.com/tanguilp/jwks_uri_updater"
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger],
      mod: {JWKSURIUpdater.Application, []}
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:dialyxir, "~> 1.0.0-rc.4", only: [:dev], runtime: false},
      {:ex_doc, "~> 0.19", only: :dev, runtime: false},
      {:hackney, "~> 1.0"},
      {:jose_utils, "~> 0.1"},
      {:poison, "~> 4.0"},
      {:tesla, "~> 1.3.0"}
    ]
  end

  def package() do
    [
      licenses: ["Apache-2.0"],
      links: %{"GitHub" => "https://github.com/tanguilp/jwks_uri_updater"}
    ]
  end
end
