=begin
Given an array of integers A, find and return whether the given array contains a non-empty subarray with a sum equal to 0.

If the given array contains a sub-array with sum zero return 1, else return 0.



Problem Constraints
1 <= |A| <= 100000

-10^9 <= A[i] <= 10^9



Input Format
The only argument given is the integer array A.



Output Format
Return whether the given array contains a subarray with a sum equal to 0.



Example Input
Input 1:

 A = [1, 2, 3, 4, 5]
Input 2:

 A = [-1, 1]


Example Output
Output 1:

 0
Output 2:

 1

Example Explanation
Explanation 1:

 No subarray has sum 0.
Explanation 2:

 The array has sum 0.

Tips:

Try using the prefix sum array.
The idea is to iterate through the array, and for every element A[i],
calculate sum of elements from 0 to i (this can simply be done as sum += arr[i]).

Sum(i,j) = PS[j] - PS[i-1]
Sum(i,j) = 0
PS[j] - PS[i-1] = 0
PS[j] = PS[i-1]

Java:
public class Solution {
    public int solve(ArrayList < Integer > A) {
        HashSet < Long > set = new HashSet < Long > ();
        long sum = 0;
        set.add(sum);
        for (int x: A) {
            sum += x;
            if (set.contains(sum)) return 1;
            else {
                set.add(sum);
            }
        }
        return 0;
    }
}
=end
require 'set'

class Solution
  # @param a : array of integers
  # @return an integer
  def solve(a)
    ans = 0
    return 1 if a.length == 1 && a[0] == 0
    prefix_sum = [a[0]]
    set = Set.new(prefix_sum)
    for i in 1...a.length
      sum = prefix_sum[i - 1] + a[i]
      prefix_sum[i] = sum
      if sum == 0
        ans = 1
        break
      end
      if set.include?(sum)
        ans = 1
        break
      else
        set.add(sum)
      end

    end
    return ans
  end
end

puts Solution.new.solve([1, 2, 3, 4, 5])
puts Solution.new.solve([1, 2, -2, 4, 5])