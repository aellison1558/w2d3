require 'rspec'
require 'deck'

describe "Deck" do
  subject(:deck) { Deck.new }

  describe "Deck#initialize" do

    it "starts with a new deck" do
      expect(deck.current_deck).to_not be_nil
    end
  end

  describe "Deck#populate_deck" do

    it "returns array of Cards" do
      expect(deck.current_deck).to all(be_a(Card))
    end

    it "builds a full deck (52 Cards)" do
      expect(deck.current_deck.count).to eq(52)
    end

    it "doesn't duplicate Cards" do
      test_card = Card.new(2, :spades)
      number_of_test_cards = 0
      deck.current_deck.each {|card| number_of_test_cards += 1 if card.==(test_card)}
      expect(number_of_test_cards).to eq(1)
    end
  end

  describe "Deck#deal(number_of_cards)" do

    it "deals the correct number of cards" do
      expect(deck.deal(5).count).to eq(5)
    end

    it "removes dealt cards from deck" do
      deck.deal(2)
      expect(deck.current_deck.count).to eq(50)
    end

  end
end
