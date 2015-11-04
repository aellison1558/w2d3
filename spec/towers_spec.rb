require 'rspec'
require 'towers'

describe "Towers of Hanoi" do
  subject(:towers_game) { TowersGame.new }

  describe "TowersGame#initialize" do
    it "initializes with three towers" do
      expect { towers_game.tower1 }.to_not raise_error
      expect { towers_game.tower2 }.to_not raise_error
      expect { towers_game.tower3 }.to_not raise_error
    end

    it "starts with disks in tower 1" do
      expect(towers_game.tower1).to eq([3, 2, 1])
      expect(towers_game.tower2).to be_empty
      expect(towers_game.tower3).to be_empty
    end
  end

  describe "TowersGame#valid_move?(from_tower, to_tower)" do
    let(:tower1) { [3, 2] }
    let(:tower2) { [1] }
    let(:tower3) { [] }


    it "returns false if moving from an empty tower" do

      expect(towers_game.valid_move?(tower3, tower2)).to eq(false)
    end

    it "returns true if moving to an empty tower" do
      expect(towers_game.valid_move?(tower1, tower3)).to eq(true)
    end

    it "returns false if moving a big disk under a small disk" do
      expect(towers_game.valid_move?(tower1, tower2)).to eq(false)
    end

    it "returns true if moving a small disk over a big disk" do
      expect(towers_game.valid_move?(tower2, tower1)).to eq(true)
    end
  end

  describe "TowersGame#move(from_tower, to_tower)" do
    let(:tower1) { [3, 2] }
    let(:tower2) { [1] }
    let(:tower3) { [] }

    it "moves a disk from one tower to another" do
      towers_game.move(tower2, tower3)
      expect(tower2).to be_empty
      expect(tower3).to eq([1])
    end

    it "doesn't execute invalid moves" do
      expect {towers_game.move(tower1, tower2)}.to_not change{ tower1 }
      expect {towers_game.move(tower1, tower2)}.to_not change{ tower2 }
    end
  end

  describe "TowersGame#won?" do

    it "returns true if all disks on tower 2" do
      towers_game.tower1 = []
      towers_game.tower2 = [3, 2, 1]
      expect(towers_game.won?).to eq(true)
    end

    it "returns true if all disks on tower 3" do
      towers_game.tower1 = []
      towers_game.tower3 = [3, 2, 1]
      expect(towers_game.won?).to eq(true)
    end

    it "returns false if any disks on tower 1" do
      expect(towers_game.won?).to eq(false)
    end

    it "returns false if disks spread" do
      towers_game.tower1 = [1]
      towers_game.tower2 = [3, 2]
      expect(towers_game.won?).to eq(false)
    end
  end



end
