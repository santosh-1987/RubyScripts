=begin
Problem Description
Given an unsorted integer array A of size N.

Find the length of the longest set of consecutive elements from array A.



Problem Constraints
1 <= N <= 106

-106 <= A[i] <= 106



Input Format
First argument is an integer array A of size N.



Output Format
Return an integer denoting the length of the longest set of consecutive elements from the array A.



Example Input
Input 1:

A = [100, 4, 200, 1, 3, 2]
Input 2:

A = [2, 1]


Example Output
Output 1:

 4
Output 2:

 2


Example Explanation
Explanation 1:

 The set of consecutive elements will be [1, 2, 3, 4].
Explanation 2:

 The set of consecutive elements will be [1, 2].

=end
require 'pry'
require 'set'
class Solution
  # @param a : constant array of integers
  # @return an integer
  def longestConsecutive(a)
    set = Set.new(a)
    ans = 1
    for i in 0...a.length
      length = 1
      unless set.include?(a[i] - 1)
        val = a[i] + 1
        loop do
          break unless set.include?(val)
          length += 1
          val +=1
        end
        ans = length > ans ? length : ans
      end
    end
    return ans
  end
end

puts Solution.new.longestConsecutive([100, 4, 200, 1, 3, 2])
