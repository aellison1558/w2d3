require 'rspec'
require 'card'

describe "Card" do
  subject(:card) {Card.new(2, :heart)}

  describe 'Card#initialize' do

    it "has a value and suite" do
      expect(card.value).to_not be_nil
      expect(card.suite).to_not be_nil
    end
  end
end
