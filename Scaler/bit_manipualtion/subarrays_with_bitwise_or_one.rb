=begin
Given an array B of length A with elements 1 or 0. Find the number of subarrays with bitwise OR 1.

Example Input
Input 1:
 A = 3
B = [1, 0, 1]
Input 2:
 A = 2
B = [1, 0]

Example Output
Output 1:
5
Output2:
2
=end

class Solution
  # @param a : integer
  # @param b : array of integers
  # @return a long
  def solve(a, b)
    last = 0
    ans = 0
    for i in 0...a
      last = i+1 if b[i] == 1
      ans += last
    end
    return ans
  end
end
