=begin
Given two integer arrays, A and B of size N and M, respectively. Your task is to find all the common elements in both the array.

NOTE:

Each element in the result should appear as many times as it appears in both arrays.
The result can be in any order.


Problem Constraints
1 <= N, M <= 105

1 <= A[i] <= 109



Input Format
First argument is an integer array A of size N.

Second argument is an integer array B of size M.



Output Format
Return an integer array denoting the common elements.



Example Input
Input 1:

 A = [1, 2, 2, 1]
 B = [2, 3, 1, 2]
Input 2:

 A = [2, 1, 4, 10]
 B = [3, 6, 2, 10, 10]


Example Output
Output 1:

 [1, 2, 2]
Output 2:

 [2, 10]


Example Explanation
Explanation 1:

 Elements (1, 2, 2) appears in both the array. Note 2 appears twice in both the array.
Explantion 2:

 Elements (2, 10) appears in both the array.
=end
require 'pry'

class Solution
  # @param a : array of integers
  # @param b : array of integers
  # @return an array of integers
  def solve(a, b)
    hash = {}
    op = []
    a.each do |ele|
      count = hash[ele]
      hash[ele] = count.nil? ? 1 : count + 1
    end
    # TODO: TLE ERROR for Commented Code
    # hash.each do |key, count|
    #   b_key_count = b.count(key)
    #   next if b_key_count == 0
    #   if b_key_count == count
    #     op << [key] * count
    #   else
    #     min_count = b_key_count < count ? b_key_count : count
    #     op << [key] * min_count
    #   end
    # end
    b.each do |ele|
      break if hash.empty?

      if !hash[ele].nil?
        hash[ele] = hash[ele] - 1
        op << ele
        hash.delete(ele) if hash[ele] < 1
      end
    end
    return op
  end
end

puts "#{Solution.new.solve([1, 2, 2, 1], [2, 3, 1, 2])}"
