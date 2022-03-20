=begin
You are given an integer array C of size A. Now you need to find a subarray (contiguous elements) so that the sum of contiguous elements is maximum.
But the sum must not exceed B.

https://www.scaler.com/academy/mentee-dashboard/class/19142/assignment/problems/16121?navref=cl_tt_lst_nm

Problem Constraints
1 <= A <= 103
1 <= B <= 109
1 <= C[i] <= 10

Input Format
The first argument is the integer A.
The second argument is the integer B.
The third argument is the integer array C.

Output Format
Return a single integer which denotes the maximum sum.


Example Input
Input 1:
A = 5
B = 12
C = [2, 1, 3, 4, 5]
Output :12

Input 2:
A = 3
B = 1
C = [2, 2, 2]
Output :0

Example Explanation
Explanation 1:
We can select {3,4,5} which sums up to 12 which is the maximum possible sum.
Explanation 2:

=end

class Solution
  # @param a : integer
  # @param b : integer
  # @param c : array of integers
  # @return an integer
  def maxSubarray(array_length, max_sum, arr)
    prefix_sum = [arr[0]]
    sub_array_sum = 0
    1.upto(array_length - 1) do |i|
      prefix_sum << prefix_sum[i - 1] + arr[i]
    end
    for i in 0...array_length
      for j in i...array_length
        if i == 0
          sum = prefix_sum[j]
        else
          sum = prefix_sum[j] - prefix_sum[i - 1]
        end
        #Check for if sum is greater than sub array sum
        unless sum > max_sum
          sub_array_sum = sub_array_sum < sum ? sum : sub_array_sum
        end
      end
    end
    return sub_array_sum

  end
end

puts Solution.new.maxSubarray(5, 12, [2, 1, 3, 4, 5])
puts Solution.new.maxSubarray(3, 1, [2, 2, 2])
