class Solution
  # @param a : integer
  # @return an integer
  # Assumption: Solve Method returns sum of a
  def solve(a)
    return sum(a)
  end

  def sum(digit)
    return 0 if digit == 0
    # return digit if digit < 10
    return digit % 10 + sum(digit / 10)
  end
end

puts Solution.new.solve(46)