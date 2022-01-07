require 'pry'
class Solution
  # @param a : array of integers
  # @return an integer
  def solve(a)
    partitions = a.partition { |num| num.odd? }

    return partitions[1].max - partitions[0].min
  end
end

Solution.new.solve([75,6,7,43,2,1,3,4,56,43,2,1,2,0])