require_relative 'card'

class Deck

SUITES = [:spades, :hearts, :diamonds, :clubs]
attr_reader :current_deck

  def initialize
    @current_deck = populate_deck
    @current_deck.shuffle!
  end

  def populate_deck

    the_deck = []

    SUITES.each do |suite|
      (2..14).each do |num|
        the_deck << Card.new(num, suite)
      end
    end

    the_deck
  end

  def deal(number_of_cards)
    @current_deck.pop(number_of_cards)
  end
end
