defmodule ChaosSpawn.Mixfile do
  use Mix.Project

  def project do
    [app: :connection,
     name: "Chaos Spawn",
     description: """
     Providing tools to randomly kill proceses. With the goal of creating
     robust supevision trees.
     """,
     package: [
       maintainers: ["Steve Brazier"],
       licenses: ["MIT"],
       links: %{"GitHub" => "https://github.com/meadsteve/chaos-spawn"},
     ],
     version: "0.9.0",
     elixir: "~> 1.4",
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     deps: deps()]
  end

  # Configuration for the OTP application
  #
  # Type `mix help compile.app` for more information
  def application do
    [applications: [:logger, :timex], mod: {ConnectionHelper, []}]
  end

  # Dependencies can be Hex packages:
  #
  #   {:mydep, "~> 0.3.0"}
  #
  # Or git/path repositories:
  #
  #   {:mydep, git: "https://github.com/elixir-lang/mydep.git", tag: "0.1.0"}
  #
  # Type `mix help deps` for more examples and options
  defp deps do
    [
      {:exactor, "~> 2.2.0"},
      {:timex, "~> 3.0.5"},

      {:credo, "~> 0.8", only: [:dev, :test]},

      {:ex_doc, "~> 0.19", only: :dev}
    ]
  end
end
