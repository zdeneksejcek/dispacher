defmodule Dispacher.Mixfile do
  use Mix.Project

  def project do
    [
      app: :dispacher,
      version: "0.1.0",
      build_path: "../../_build",
      config_path: "../../config/config.exs",
      deps_path: "../../deps",
      lockfile: "../../mix.lock",
      elixir: "~> 1.5",
      start_permanent: Mix.env == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger],
      mod: {Dispacher.Application, []},
      applications: [:cowboy, :ranch]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      { :cowboy, github: "ninenines/cowboy", tag: "2.0.0-rc.3" },
      { :jsex, "~> 2.0.0" }
    ]
  end
end
