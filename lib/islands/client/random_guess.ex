# ┌─────────────────────────────────────────────────────────────────┐
# │ Inspired by the course "Elixir for Programmers" by Dave Thomas. │
# └─────────────────────────────────────────────────────────────────┘
defmodule Islands.Client.RandomGuess do
  @moduledoc """
  Returns a random guess in the _Game of Islands_.

  ##### Inspired by the course [Elixir for Programmers](https://codestool.coding-gnome.com/courses/elixir-for-programmers) by Dave Thomas.
  """

  use PersistConfig

  alias Islands.Client.State
  alias Islands.{Coord, Tally}

  @board_set (for row <- 1..10, col <- 1..10, into: MapSet.new() do
                Islands.Coord.new!(row, col)
              end)

  @doc """
  Returns a random guess in the _Game of Islands_.
  """
  @dialyzer {:no_opaque, new: 1}
  @dialyzer {:no_return, new: 1}
  @spec new(State.t() | Tally.t()) :: String.t() | Coord.square()
  def new(client_state_or_tally)

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
