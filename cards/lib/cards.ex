defmodule Cards do
  @moduledoc """
  this module provides methods to play with deck of cards
  """

  @doc """
  returns a list of string representing a deck
  """
  def create_deck do

    values = ["Ace","Two","Three","Four","Five"]
    suits = ["Spades", "Clubs", "Hearts", "Diamonds"]

    for suit <- suits ,value <- values do
        "#{value} Of #{suit}"
    end

  end

  def shuffle(deck) do
    Enum.shuffle(deck)
  end

  def contains?(deck, card) do
    Enum.member?(deck, card)
  end
@doc """
divides the deck into two with a chosen hand_size

##Examples
iex -> aaa
"""
  def deal(deck, hand_size) do
    Enum.split(deck, hand_size)
  end

  def save(deck, filename) do
    binary = :erlang.term_to_binary(deck)
    File.write(filename, binary)
  end

  def load(filename) do
    case File.read(filename) do
      {:ok, binary} -> :erlang.binary_to_term(binary)
      {:error, _reason} -> "Something went wrong"
    end
  end

  def create_hand(hand_size) do
    Cards.create_deck
    |> Cards.shuffle
    |> Cards.deal(hand_size)
  end

end
