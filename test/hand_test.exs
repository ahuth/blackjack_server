defmodule Blackjack.HandTest do
  use ExUnit.Case, async: true

  alias Blackjack.Hand

  test "not busted" do
    assert {:ok, hand} = hand([2])
  end

  test "busted" do
    assert {:busted, hand} = hand([2, :jack, :king])
  end

  def hand(ranks) do
    deal_cards(Hand.new(), Enum.map(ranks, &card/1))
  end

  def deal_cards(hand, [card]), do: Hand.deal(hand, card)
  def deal_cards(hand, [card | remaining]) do
    {:ok, hand} = Hand.deal(hand, card)
    deal_cards(hand, remaining)
  end

  def card(rank), do: %{rank: rank, suit: :hearts}
end
