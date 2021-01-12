# ┌─────────────────────────────────────────────────────────────────┐
# │ Inspired by the course "Elixir for Programmers" by Dave Thomas. │
# └─────────────────────────────────────────────────────────────────┘
defmodule Islands.Client.RandomGuess do
  @moduledoc """
  Makes a random guess in the _Game of Islands_.

  ##### Inspired by the course [Elixir for Programmers](https://codestool.coding-gnome.com/courses/elixir-for-programmers) by Dave Thomas.
  """

  use PersistConfig

  alias Islands.Client.State
  alias Islands.{Coord, Tally}

  @board_set get_env(:board_set)

  @type square :: 1..100

  @dialyzer {:nowarn_function, new: 1}
  @spec new(State.t() | Tally.t()) :: String.t() | square
  def new(%State{tally: %Tally{guesses: guesses}} = _state) do
    @board_set
    |> MapSet.difference(guesses.hits)
    |> MapSet.difference(guesses.misses)
    |> Enum.random()
    |> Coord.to_row_col()
  end

  def new(%Tally{guesses: guesses} = _tally) do
    @board_set
    |> MapSet.difference(guesses.hits)
    |> MapSet.difference(guesses.misses)
    |> Enum.random()
    |> Coord.to_square()
  end
end
