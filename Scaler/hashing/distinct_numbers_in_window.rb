=begin
Problem Description
You are given an array of N integers, A1, A2 ,..., AN and an integer B. Return the of count of distinct numbers in all windows of size B.

Formally, return an array of size N-B+1 where i'th element in this array contains number of distinct elements in sequence Ai, Ai+1 ,..., Ai+B-1.

NOTE: if B > N, return an empty array.



Input Format
First argument is an integer array A
Second argument is an integer B.



Output Format
Return an integer array.



Example Input
Input 1:

 A = [1, 2, 1, 3, 4, 3]
 B = 3
Input 2:

 A = [1, 1, 2, 2]
 B = 1


Example Output
Output 1:

 [2, 3, 3, 2]
Output 2:

 [1, 1, 1, 1]


Example Explanation
Explanation 1:

 A=[1, 2, 1, 3, 4, 3] and B = 3
 All windows of size B are
 [1, 2, 1]
 [2, 1, 3]
 [1, 3, 4]
 [3, 4, 3]
 So, we return an array [2, 3, 3, 2].
Explanation 2:

 Window size is 1, so the output array is [1, 1, 1, 1].
=end

require 'pry'
require 'set'

class Solution
  # @param a : array of integers
  # @param b : integer
  # @return an array of integers
  def dNums(a, b)
    n = a.length
    return Array.new(n) { 1 } if b == 1
    ans_arr = []
    ans = {}
    return ans_arr if b > n
    for i in 0..b - 1
      elem = a[i]
      if ans[elem].nil?
        ans[elem] = 1
      else
        ans[elem] += 1
      end
    end
    ans_arr << ans.count

    i = 1
    j = b

    while j <= n - 1
      ans[a[i - 1]] -= 1
      ans.delete(a[i - 1]) if ans[a[i - 1]] == 0
      if ans[a[j]].nil?
        ans[a[j]] = 1
      else
        ans[a[j]] += 1
      end
      ans_arr << ans.count
      i += 1
      j += 1
    end
    return ans_arr
  end
end

print Solution.new.dNums([1, 2, 1, 3, 4, 3], 3)

