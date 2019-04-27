defmodule Blackjack.Hand do
  alias __MODULE__
  defstruct [:cards, :score]

  def new(), do: %Hand{cards: [], score: 0}

  def deal(hand, card) do
    cards = [card | hand.cards]
    score = sum(cards)
    new_hand = %Hand{cards: cards, score: score}

    case score do
      x when x <= 21 -> {:ok, new_hand}
      _ -> {:busted, new_hand}
    end
  end

  def sum(cards), do: sum(cards, 0)
  def sum([], total), do: total
  def sum([head | tail], total) do
    sum(tail, total + Blackjack.Deck.card_value(head))
  end
end
