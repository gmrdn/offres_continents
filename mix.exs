defmodule OffresContinents.MixProject do
  use Mix.Project

  def project do
    [
      app: :offres_continents,
      version: "0.1.0",
      elixir: "~> 1.10",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger, :table_rex]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      # {:dep_from_git, git: "https://github.com/elixir-lang/my_dep.git", tag: "0.1.0"}
      {:table_rex, "~> 2.0.0"},
      {:csv, "~> 2.3"},
      {:geocoder, "~> 1.0"},
      {:topo, "~> 0.4.0"},
      {:geo, "~> 3.0"}
    ]
  end
end
