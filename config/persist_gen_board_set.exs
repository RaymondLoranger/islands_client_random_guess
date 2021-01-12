import Config

coord_range = 1..10

board_set =
  for row <- coord_range, col <- coord_range, into: MapSet.new() do
    {:ok, coord} = Islands.Coord.new(row, col)
    coord
  end

config :islands_client_random_guess, board_set: board_set
