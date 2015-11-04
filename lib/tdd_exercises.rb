class Array
  def my_uniq
    result = []
    each do |element|
      result << element unless result.include?(element)
    end
    result
  end

  def two_sum(target = 0)
    result = []
    (0...(self.length - 1)).each do |i|
      next unless self[i].is_a?(Fixnum)
      ((i + 1)...self.length).each do |j|
        next unless self[j].is_a?(Fixnum)
        if self[j] + self[i] == target
          result << [i, j]
        end
      end
    end
    result
  end

  def my_transpose
    result = []

    return self if self.any? { |el| el.class != Array }
    (0...self[0].length).each do |col_idx|
      sub_array = []
      self.each do |row|
        sub_array << row[col_idx]
      end
      result << sub_array
    end
    result
  end
end
