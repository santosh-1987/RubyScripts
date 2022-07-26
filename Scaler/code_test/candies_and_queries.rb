# Hint: Use Sort+ Binary Search
require 'pry'
class Solution
  # @param a : integer
  # @param b : array of array of integers
  # @param c : array of integers
  # @return an array of integers
  def solve(a, b, c)
    arr = Array.new(a) { 0 }
    ans = []
    b.each do |pair|
      left = pair[0] - 1
      right = pair[1] - 1
      left.upto(right).each do |index|
        arr[index] = arr[index] + 1
      end
    end

    c.each do |query|
      ans << arr.select { |elem| elem >= query }.count
    end
    return ans
  end
end

print Solution.new.solve(4, [[1, 2], [4, 4], [1, 3]], [1, 2, 3])