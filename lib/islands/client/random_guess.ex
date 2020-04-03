# ┌─────────────────────────────────────────────────────────────────┐
# │ Inspired by the course "Elixir for Programmers" by Dave Thomas. │
# └─────────────────────────────────────────────────────────────────┘
defmodule Islands.Client.RandomGuess do
  use PersistConfig

  @course_ref Application.get_env(@app, :course_ref)

  @moduledoc """
  Makes a random guess in the _Game of Islands_.
  \n##### #{@course_ref}
  """

  alias Islands.Client.State
  alias Islands.{Coord, Tally}

  @coord_range 1..10
  @board_set Application.get_env(@app, :gen_board_set).(@coord_range)

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
