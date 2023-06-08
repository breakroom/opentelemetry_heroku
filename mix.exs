defmodule OpentelemetryHeroku.MixProject do
  use Mix.Project

  def project do
    [
      app: :opentelemetry_heroku,
      version: "0.1.0",
      elixir: "~> 1.12",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      package: package()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:opentelemetry, "~> 1.3"},
      {:opentelemetry_api, "~> 1.2"},
      {:ex_doc, "~> 0.29", only: [:dev], runtime: false}
    ]
  end

  defp package do
    [
      name: "opentelemetry_heroku",
      description: "OpenTelemetry resource metadata for Heroku",
      maintainers: ["Tom Taylor"],
      licenses: ["Apache-2.0"],
      files: ~w(lib .formatter.exs mix.exs README* LICENSE* CHANGELOG*),
      source_url: "https://github.com/breakroom/opentelemetry_heroku",
      links: %{
        "GitHub" => "https://github.com/breakroom/opentelemetry_heroku"
      }
    ]
  end
end
