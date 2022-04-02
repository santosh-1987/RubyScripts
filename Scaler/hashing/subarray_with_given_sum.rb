=begin
Given an array of positive integers A and an integer B, find and return first continuous subarray which adds to B.

If the answer does not exist return an array with a single element "-1".

First sub-array means the sub-array for which starting index in minimum.

Problem Constraints

1 <= length of the array <= 100000
1 <= A[i] <= 109
1 <= B <= 109

Input Format

The first argument given is the integer array A.

The second argument given is integer B.

Output Format

Return the first continuous sub-array which adds to B and if the answer does not exist return an array with a single element "-1".

Example Input

Input 1:

 A = [1, 2, 3, 4, 5]
 B = 5
Input 2:

 A = [5, 10, 20, 100, 105]
 B = 110


Example Output

Output 1:

 [2, 3]
Output 2:

 -1


Example Explanation

Explanation 1:

 [2, 3] sums up to 5.
Explanation 2:

 No subarray sums up to required number.

https://www.scaler.com/academy/mentee-dashboard/class/23210/assignment/problems/4116/submissions
=end

class Solution
  # @param a : array of integers
  # @param b : integer
  # @return an array of integers
  def solve(a, b)
    start = 0
    curr_sum = 0
    for i in 0..a.length
      # puts i
      while curr_sum > b and start < i - 1
        curr_sum = curr_sum - a[start]
        start += 1
      end

      if curr_sum == b
        return a[start..i - 1]
      end

      if i < a.length
        curr_sum = curr_sum + a[i]
      end
      i += 1
    end
    return [-1]
  end

  def contains(arr, k)
    set = Set.new
    for i in 0...arr.length
      if (set.include?(k - arr[i]))
        return [arr[i], k - arr[i]]
      end
      set.add(arr[i])
    end
    return false
  end
end

puts "#{Solution.new.solve([1,5], 5)}"
# puts "#{Solution.new.solve([1, 2, 3, 4, 5], 5)}"
# puts "#{Solution.new.solve([5, 10, 20, 100, 105], 110)}"
# puts "#{Solution.new.solve([42, 9, 38, 36, 48, 33, 36, 50, 38, 8, 13, 37, 33, 38, 17, 25, 50, 50, 41, 29, 34, 18, 16, 6, 49, 16, 21, 29, 41, 7, 37, 14, 5, 30, 35, 26, 38, 35, 9, 36, 34, 39, 9, 4, 41, 40, 3, 50, 27, 17, 14, 5, 31, 42, 5, 39, 38, 38, 47, 24, 41, 5, 50, 9, 29, 14, 19, 27, 6, 23, 17, 1, 22, 38, 35, 6, 35, 41, 34, 21, 30, 45, 48, 45, 37], 100)}"