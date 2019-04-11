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

  @dialyzer {:nowarn_function, new: 1}
  @spec new(State.t()) :: String.t()
  def new(%State{tally: %Tally{guesses: guesses}} = _state) do
    %Coord{row: row, col: col} =
      @board_set
      |> MapSet.difference(guesses.hits)
      |> MapSet.difference(guesses.misses)
      |> Enum.random()

    "#{row} #{col}"
  end
end
