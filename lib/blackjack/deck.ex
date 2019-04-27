defmodule Blackjack.Deck do
  @cards for suit <- [:spades, :hearts, :diamonds, :clubs],
             rank <- [2, 3, 4, 5, 6, 7, 8, 9, 10, :jack, :queen, :king, :ace],
         do: %{suit: suit, rank: rank}

  def shuffled(), do: Enum.shuffle(@cards)

  def take([card | rest]), do: {:ok, card, rest}
  def take([]), do: {:error, :empty}

  def card_value(%{rank: :ace, suit: _}, :soft), do: 1
  def card_value(%{rank: :ace, suit: _}, :hard), do: 11
  def card_value(%{rank: rank, suit: _}, _type) when rank in [:jack, :queen, :king], do: 10
  def card_value(card, _type), do: card.rank
end
