=begin
Given two integers A and B, find the greatest possible positive integer M, such that A % M = B % M.
Input 1:

A = 1
B = 2
Input 2:

A = 5
B = 10

Output 1:

1
Output 2:

5
=end

class Solution
  # @param a : integer
  # @param b : integer
  # @return an integer
  def solve(a, b)
    greater, lower = a > b ? [a,b] : [b,a]
    # ans = 0
    # 1.upto(greater).each do |i|
    #   if a%i == b%i
    #     ans = i
    #   end
    # end
    # return ans
    return greater - lower
  end
end
puts Solution.new.solve(106978,4487506)