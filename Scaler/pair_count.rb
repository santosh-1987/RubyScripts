require 'pry'
class Solution
  # @param a : array of integers
  # @param b : integer
  # @return an integer
  def solve(a, b)
    a = a.reject{ |num| num >= b }
    pairs = a.combination(2).each_slice(4).to_a

    count = 0
    pairs.each do |pair|
      pair.each { |elem| count += 1 if elem.inject(:+) == b}
    end

    return count
  end
end

puts Solution.new.solve([1,2,3], 8)