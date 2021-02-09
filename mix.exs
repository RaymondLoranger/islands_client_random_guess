defmodule Islands.Client.RandomGuess.MixProject do
  use Mix.Project

  def project do
    [
      app: :islands_client_random_guess,
      version: "0.1.18",
      elixir: "~> 1.11",
      start_permanent: Mix.env() == :prod,
      name: "Islands Client Random Guess",
      source_url: source_url(),
      description: description(),
      package: package(),
      deps: deps()
    ]
  end

  defp source_url do
    "https://github.com/RaymondLoranger/islands_client_random_guess"
  end

  defp description do
    """
    Makes a random guess in the Game of Islands.
    """
  end

  defp package do
    [
      files: ["lib", "mix.exs", "README*", "config/persist*.exs"],
      maintainers: ["Raymond Loranger"],
      licenses: ["MIT"],
      links: %{"GitHub" => source_url()}
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
      {:dialyxir, "~> 1.0", only: :dev, runtime: false},
      {:ex_doc, "~> 0.22", only: :dev, runtime: false},
      {:islands_client_state, "~> 0.1"},
      {:islands_coord, "~> 0.1"},
      {:islands_tally, "~> 0.1"},
      {:persist_config, "~> 0.4", runtime: false}
    ]
  end
end
