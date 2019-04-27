defmodule Blackjack.Hand do
  def new(), do: []

  def deal(hand, card) do
    case sum([card | hand]) do
      x when x <= 21 -> {:ok, [card | hand]}
      _ -> {:busted, [card | hand]}
    end
  end

  def sum(cards), do: sum(cards, 0)
  def sum([], total), do: total
  def sum([head | tail], total) do
    sum(tail, total + Blackjack.Deck.card_value(head))
  end
end
