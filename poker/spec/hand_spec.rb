require 'rspec'
require 'hand'

describe "Hand" do
  cards = [Card.new(2, :spades), Card.new(3, :spades), Card.new(4, :spades), Card.new(5, :spades), Card.new(2, :clubs)]
  subject(:hand) { Hand.new(cards) }

  #Hand has five cards
  #Hand can calculate its value
  #Hand can discard certain cards
  #Hand can replace discarded cards with dealt cards

  describe "Hand#initialize(cards)" do

    it "has an array of cards" do
      expect(hand.cards).to all(be_a(Card))
    end

    it "has five cards" do
      expect(hand.cards.count).to eq(5)
    end
  end

  describe "Hand#value" do

    it "returns the value of the hand" do
      expect(hand.value).to eq(2)
    end
  end

  describe "Hand#discard(which_cards)" do
    before(:each) do 
      which_cards = [4]
      hand.discard(which_cards)
    end

    it "picks up a new card" do
      expect(hand.cards[4]).to_not be_nil
    end

    it "discards old card" do
      expect(hand.cards[4].value).to_not eq(2)
    end

  end

end
