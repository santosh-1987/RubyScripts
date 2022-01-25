require 'pry'

class Solution
  # @param a : integer
  # @param b : array of integers
  # @return an integer
  def solve(a, b)
    lines_read = 0
    day = 0

    while true
      break if lines_read >= a
      b.each_with_index do |count, _day|
        day = _day + 1
        lines_read += count
        break if lines_read >= a
      end
    end
    day
  end
end

puts Solution.new.solve(100, [15, 20, 20, 15, 10, 30, 45])

puts Solution.new.solve(2, [1, 0, 0, 0, 0, 0, 0])