class Card
  attr_reader :value, :suite

  def initialize(value, suite)
    @value = value
    @suite = suite
  end

  def ==(other)
    if @value == other.value && @suite == other.suite
      true
    else
      false
    end
  end

end
