defmodule Islands.Client.RandomGuessTest do
  use ExUnit.Case, async: true

  alias Islands.Client.RandomGuess

  doctest RandomGuess

  test "the truth" do
    assert 1 + 2 == 3
  end
end
