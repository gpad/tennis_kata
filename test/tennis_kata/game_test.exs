defmodule TennisKata.GameTest do
  use ExUnit.Case
  alias TennisKata.Game

  test "score goes to 15-0 when server wins" do
    game = Game.new
    game = Game.server_win(game)
    assert Game.get_score(game) == {:"15", :"0"}
  end
  test "score goes to 0-15 when receiver wins" do
    game = Game.new
    game = Game.receiver_win(game)
    assert Game.get_score(game) == {:"0", :"15"}
  end
  test "score goes to 30-0 when server wins two times" do
    game = Game.new
    game = Game.server_win(game)
    game = Game.server_win(game)
    assert Game.get_score(game) == {:"30", :"0"}
  end
  test "score goes to 0-30 when receiver wins two times" do
    game = Game.new
    game = Game.receiver_win(game)
    game = Game.receiver_win(game)
    assert Game.get_score(game) == {:"0", :"30"}
  end
  test "score goes to 15-15 when server and receiver wins" do
    game = Game.new
    game = Game.server_win(game)
    game = Game.receiver_win(game)
    assert Game.get_score(game) == {:"15", :"15"}
  end

  # End Story 1

  # Begin Story 2

  test "player to win go to A after 40" do
    game = Game.new(:"40", :"40")
    game = Game.receiver_win(game)
    assert Game.get_score(game) == {:"40", :"A"}
  end

  test "player lost A if opposite win point" do
    game = Game.new(:"A", :"40")
    game = Game.receiver_win(game)
    assert Game.get_score(game) == {:"40", :"40"}
  end

  # End Story 2

  # Begin Story 3
  test "win player with 2 points of advantage" do
    game = Game.new(:"40", :"30")
    game = Game.server_win(game)
    assert Game.who_wins(game) == :server
  end

  test "also receiver player with 2 points of advantage" do
    game = Game.new(:"15", :"40")
    game = Game.receiver_win(game)
    assert Game.who_wins(game) == :receiver
  end

  test "server win with point in advantage" do
    game = Game.new(:"A", :"40")
    game = Game.server_win(game)
    assert Game.who_wins(game) == :server
  end

  test "receiver win with point in advantage" do
    game = Game.new(:"40", :"A")
    game = Game.receiver_win(game)
    assert Game.who_wins(game) == :receiver
  end
  # End Story 3
end
