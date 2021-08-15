defmodule CrawlerTruyen.MixProject do
  use Mix.Project

  def project do
    [
      app: :crawler_truyen,
      version: "0.1.0",
      elixir: "~> 1.12",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger],
      mod: {CrawlerTruyen.Application, []}
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:tesla, "~> 1.4"},
      {:hackney, "~> 1.17"},
      {:floki, "~> 0.31.0"},
      {:ecto_sql, "~> 3.6.2"},
      {:postgrex, ">= 0.0.0"}
    ]
  end
end
