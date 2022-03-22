=begin
Given an integer array A of size N. Return 1 if the array can be arranged to form an arithmetic progression, otherwise return 0.

A sequence of numbers is called an arithmetic progression if the difference between any two consecutive elements is the same.

Problem Constraints
2 <= N <= 105

-109 <= A[i] <= 109

Input Format
The first and only argument is an integer array A of size N.

Output Format
Return 1 if the array can be rearranged to form an arithmetic progression, otherwise return 0.


Example Input
Input 1:

 A = [3, 5, 1]
Output : 1
Input 2:

 A = [2, 4, 1]
Output : 0

Example Explanation
Explanation 1:

 We can reorder the elements as [1,3,5] or [5,3,1] with differences 2 and -2 respectively, between each consecutive elements.
Explanation 2:

 There is no way to reorder the elements to obtain an arithmetic progression.
=end

class Solution
  # @param a : array of integers
  # @return an integer
  def solve(a)
    a.sort!
    diff = nil
    ap = true
    for i in 0...a.length-1
      curr_diff = (a[i+1] - a[i]).abs
      if i == 0
        diff = curr_diff
      else
        if diff != curr_diff
          ap = false
          break
        end
      end
    end
    return ap == true ? 1 : 0
  end
end

puts Solution.new.solve([3, 5, 1])


