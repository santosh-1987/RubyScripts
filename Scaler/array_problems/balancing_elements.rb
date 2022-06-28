=begin
Count ways to make sum of odd and even indexed elements equal by removing an array element

Problem Description
Given an array, arr[] of size N, the task is to find the count of array indices such that removing an element from these indices makes the sum of even-indexed and odd-indexed array elements equal.

Problem Constraints
1 <= n <= 105
-105 <= A[i] <= 105

Input Format
First argument contains an array A of integers of size N

Output Format
Return the count of array indices such that removing an element from these indices makes the sum of even-indexed and odd-indexed array elements equal.

Example Input
Input 1:
A=[2, 1, 6, 4]
Input 2:

A=[1, 1, 1]


Example Output
Output 1:
1
Output 2:

3

Example Explanation
Explanation 1:
Removing arr[1] from the array modifies arr[] to { 2, 6, 4 } such that, arr[0] + arr[2] = arr[1].
Therefore, the required output is 1.
Explanation 2:

Removing arr[0] from the given array modifies arr[] to { 1, 1 } such that arr[0] = arr[1]
Removing arr[1] from the given array modifies arr[] to { 1, 1 } such that arr[0] = arr[1]
Removing arr[2] from the given array modifies arr[] to { 1, 1 } such that arr[0] = arr[1]
Therefore, the required output is 3.

SUM(even) = PrefixSum(even)[0,i-1] + PrefixSum(odd)[i+1, N-1]
SUM(odd) = PrefixSum(odd)[0..i-1] + PrefixSum(even)[i+1,N-1]
=end

require 'pry'

class Solution
  # @param a : array of integers
  # @return an integer
  def solve(a)
    return 0 if a.length < 1

    prefix_sum_even = [a[0]]
    prefix_sum_odd = [0]
    1.upto(a.length - 1).each do |i|
      if i % 2 == 0
        prefix_sum_even << prefix_sum_even[i - 1] + a[i]
        prefix_sum_odd << prefix_sum_odd[i - 1]
      else
        prefix_sum_odd << prefix_sum_odd[i - 1] + a[i]
        prefix_sum_even << prefix_sum_even[i - 1]
      end
    end
    count = 0
    for i in 0...a.length
      sum_even = if i == 0
                   0 + (prefix_sum_odd[-1] - prefix_sum_odd[i])
                 else
                   prefix_sum_even[i - 1] + (prefix_sum_odd[-1] - prefix_sum_odd[i])
                 end
      sum_odd = if i == 0
                  0 + (prefix_sum_even[-1] - prefix_sum_even[i])
                else
                  prefix_sum_odd[i - 1] + (prefix_sum_even[-1] - prefix_sum_even[i])
                end
      count += 1 if sum_even == sum_odd
    end
    return count
  end
end

puts Solution.new.solve([2, 1, 6, 4])
puts Solution.new.solve([1, 1, 1])