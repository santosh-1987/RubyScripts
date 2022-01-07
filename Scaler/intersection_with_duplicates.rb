class Solution
  # @param a : array of integers
  # @param b : array of integers
  # @return an array of integers
  def solve(a, b)
    (a & b).flat_map { |num| [num]*[a.count(num), b.count(num)].min }
  end
end

print Solution.new.solve([1,2,2,1],[2,3,1,2])