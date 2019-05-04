defmodule Blackjack.DeckTest do
  use ExUnit.Case, async: true

  alias Blackjack.Deck

  test "a full deck" do
    deck = Deck.shuffled()
    assert Enum.count(deck) == 52
  end

  test "drawing cards" do
    deck = Deck.shuffled()
    {:ok, card, deck} = Deck.take(deck)
    assert Enum.member?([:spades, :hearts, :diamonds, :clubs], card.suit) == true
  end

  test "valuing cards" do
    assert Deck.card_value(%{suit: :hears, rank: 2}, :soft) == 2
    assert Deck.card_value(%{suit: :hears, rank: 2}, :hard) == 2

    assert Deck.card_value(%{suit: :hears, rank: 10}, :soft) == 10
    assert Deck.card_value(%{suit: :hears, rank: 10}, :hard) == 10

    assert Deck.card_value(%{suit: :hears, rank: :queen}, :soft) == 10
    assert Deck.card_value(%{suit: :hears, rank: :queen}, :hard) == 10

    assert Deck.card_value(%{suit: :hears, rank: :ace}, :soft) == 1
    assert Deck.card_value(%{suit: :hears, rank: :ace}, :hard) == 11
  end
end
