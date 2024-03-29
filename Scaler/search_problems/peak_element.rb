=begin
Problem Description
Given an array of integers A, find and return the peak element in it. An array element is peak if it is NOT smaller than its neighbors.

For corner elements, we need to consider only one neighbor. We ensure that answer will be unique.

NOTE: Users are expected to solve this in O(log(N)) time.



Problem Constraints
1 <= |A| <= 100000

1 <= A[i] <= 109



Input Format
The only argument given is the integer array A.



Output Format
Return the peak element.



Example Input
Input 1:

A = [1, 2, 3, 4, 5]
Input 2:

A = [5, 17, 100, 11]


Example Output
Output 1:

 5
Output 2:

 100


Example Explanation
Explanation 1:

 5 is the peak.
Explanation 2:

 100 is the peak.
=end
class Solution
  # @param a : array of integers
  # @return an integer
  def solve(a)
    n = a.length

    if a[0] > a[1]
      return a[0]
    end

    if a[n - 1] > a[n - 2]
      return a[n - 1]
    end

    left = 1
    right = n - 2

    while left <= right
      mid = (left + right) / 2
      if a[mid] > a[mid - 1] && a[mid] > a[mid + 1]
        return a[mid]
      end

      if a[mid] < a[mid + 1]
        left = mid + 1
      else
        right = mid - 1
      end
    end

    return a[mid]
  end
end
