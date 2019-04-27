defmodule Blackjack.Hand do
  alias __MODULE__
  defstruct [:cards, :score]

  def new(), do: %Hand{cards: [], score: 0}

  def deal(hand, card) do
    cards = [card | hand.cards]
    hard_score = sum(cards, :hard)
    soft_score = sum(cards, :soft)
    scores = [hard_score, soft_score] |> Enum.reject(&(&1 > 21))

    case scores do
      [] -> {:busted, %Hand{cards: cards, score: soft_score}}
      _ -> {:ok, %Hand{cards: cards, score: List.first(scores)}}
    end
  end

  def sum(cards, type), do: sum(cards, type, 0)
  def sum([], _, total), do: total
  def sum([head | tail], type, total) do
    sum(tail, type, total + Blackjack.Deck.card_value(head, type))
  end
end
