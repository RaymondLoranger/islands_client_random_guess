use Mix.Config

config :islands_client_random_guess,
  gen_board_set: fn range ->
    alias Islands.Coord

    for row <- range, col <- range, into: MapSet.new() do
      {:ok, coord} = Coord.new(row, col)
      coord
    end
  end
