defmodule TennisKata.Game do

  defstruct [server: :"0", receiver: :"0", winner: nil]

  def new(server \\ :"0", receiver \\ :"0") do
    %TennisKata.Game{server: server, receiver: receiver}
  end

  def server_win(game) do
    inc_of(:server, game.server, game.receiver)
  end

  def receiver_win(game) do
    inc_of(:receiver, game.server, game.receiver)
  end

  def get_score(game) do
    {game.server, game.receiver}
  end

  def who_wins(game) do
    game.winner
  end

  defp inc_of(:server, :"40", :A), do: %TennisKata.Game{server: :"40", server: :"40"}
  defp inc_of(:server, :"40", :"40"), do: %TennisKata.Game{server: :"A", receiver: :"40"}
  defp inc_of(:server, :"A", :"40"), do: %TennisKata.Game{winner: :server}
  defp inc_of(:server, :"40", _), do: %TennisKata.Game{winner: :server}
  defp inc_of(:server, server, receiver), do: %TennisKata.Game{server: inc_of(server), receiver: receiver}
  defp inc_of(:receiver, :A, :"40"), do: %TennisKata.Game{server: :"40", receiver: :"40"}
  defp inc_of(:receiver, :"40", :"40"), do: %TennisKata.Game{server: :"40", receiver: :"A"}
  defp inc_of(:receiver, :"40", :"A"), do: %TennisKata.Game{winner: :receiver}
  defp inc_of(:receiver, _, :"40"), do: %TennisKata.Game{winner: :receiver}
  defp inc_of(:receiver, server, receiver), do: %TennisKata.Game{server: server, receiver: inc_of(receiver)}

  defp inc_of(:"0"), do: :"15"
  defp inc_of(:"15"), do: :"30"
  defp inc_of(:"30"), do: :"40"
  defp inc_of(:"40"), do: :"A"

end
