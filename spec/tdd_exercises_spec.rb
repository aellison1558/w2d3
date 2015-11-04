require 'rspec'
require 'tdd_exercises'

describe "Array methods" do
  describe "Array#my_uniq" do
    let(:sample_array) { [1, 1, 2] }

    it "removes duplicates" do
      expect(sample_array.my_uniq).to eq([1, 2])
    end

    it "returns elements in order of first appearance" do
      array = [1, 2, 1]
      expect(array.my_uniq).to eq([1, 2])
    end

    it "doesn't modify original" do
      sample_array.my_uniq
      expect(sample_array).to eq([1, 1, 2])
    end

    it "handles an empty array" do
      array = []
      expect(array.my_uniq).to eq([])
    end

    it "handles an array with no duplicates" do
      array = [1, 2, 3, 4]
      expect(array.my_uniq).to eq([1, 2, 3, 4])
    end

    it "raises an error if called on non-array" do
      expect { "array".my_uniq }.to raise_error(NoMethodError)
    end



  end

  describe "Array#two_sum(target)" do
    let(:sample_array) { [-1, 0, 2, -2, 1] }

    it "defaults to 0 as target if no target given" do
      expect(sample_array.two_sum).to eq([[0, 4],[2, 3]])
    end

    it "returns indices that sum to target" do
      expect(sample_array.two_sum(3)).to eq([[2, 4]])
    end

    it "returns an empty array if no sums possible" do
      empty = []
      one = [10]

      expect(sample_array.two_sum(10)).to eq([])
      expect(empty.two_sum(10)).to eq([])
      expect(one.two_sum(10)).to eq([])
    end

    it "ignores non-number elements" do
      mixed = [0, 1, "hi", [0, 1], -1, 2]

      expect(mixed.two_sum(1)).to eq([[0,1], [4, 5]])
    end

    it "raises an error if called on non-array" do
      expect { "array".two_sum }.to raise_error(NoMethodError)
    end
  end

  describe "Array#my_transpose" do
    let(:sample_array) {[
                          [0, 1, 2],
                          [3, 4, 5],
                          [6, 7, 8]
                        ]}

    it "transposes an array of arrays" do
      transposed = [[0, 3, 6], [1, 4, 7], [2, 5, 8]]
      expect(sample_array.my_transpose).to eq(transposed)
    end

    it "doesn't mutate original" do
      sample_array.my_transpose
      expect(sample_array).to eq([[0, 1, 2], [3, 4, 5], [6, 7, 8]])
    end

    it "doesn't transpose one dimensional arrays" do
      one_dimension = [1, 2, 3]
      expect(one_dimension.my_transpose).to eq(one_dimension)
    end

    it "raises an error if called on non-array" do
      expect { "array".my_transpose }.to raise_error(NoMethodError)
    end
  end
end

describe "Stock Picker" do
  let(:prices) {[50, 5, 7, 2, 3, 12]}

  it "finds the most profitable pair" do
    expect(stock_picker(prices)).to eq([3, 5])
  end

  it "searches in correct order" do
    expect(stock_picker(prices)).to_not eq([0, 3])
    expect(stock_picker(prices)).to_not eq([3, 0])
  end

  it "returns empty array if no profitable pairs" do
    empty = []
    one = [100]
    crash = [100, 75, 50, 25, 0]

    expect(stock_picker(empty)).to eq([])
    expect(stock_picker(one)).to eq([])
    expect(stock_picker(crash)).to eq([])
  end

  it "raises an error if passed a non-array" do
    expect { stock_picker("array") }.to raise_error
  end

end
