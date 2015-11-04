class TowersGame
  attr_accessor :tower1, :tower2, :tower3

  def initialize
    @tower1 = [3, 2, 1]
    @tower2 = []
    @tower3 = []
  end

  def valid_move?(from_tower, to_tower)
    return false if from_tower.empty?
    return true if to_tower.empty?
    return false if from_tower.last > to_tower.last
    true
  end

  def move(from_tower, to_tower)
    to_tower << from_tower.pop if valid_move?(from_tower, to_tower)
  end

  def won?
    return true if @tower2.count == 3 || @tower3.count == 3
    false
  end

end
