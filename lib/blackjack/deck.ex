defmodule Blackjack.Deck do
  @cards for suit <- [:spades, :hearts, :diamonds, :clubs],
             rank <- [2, 3, 4, 5, 6, 7, 8, 9, 10, :jack, :queen, :king, :ace],
         do: %{suit: suit, rank: rank}

  def shuffled(), do: Enum.shuffle(@cards)

  def take([card | rest]), do: {:ok, card, rest}
  def take([]), do: {:error, :empty}
end
