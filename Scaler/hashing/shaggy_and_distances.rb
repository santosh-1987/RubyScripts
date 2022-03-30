=begin
Shaggy has an array A consisting of N elements. We call a pair of distinct indices in that array a special if elements at those indices in the array are equal.

Shaggy wants you to find a special pair such that the distance between that pair is minimum. Distance between two indices is defined as |i-j|. If there is no special pair in the array, then return -1.



Problem Constraints
1 <= |A| <= 105



Input Format
The first and only argument is an integer array A.



Output Format
Return one integer corresponding to the minimum possible distance between a special pair.



Example Input
Input 1:

A = [7, 1, 3, 4, 1, 7]
Input 2:

A = [1, 1]


Example Output
Output 1:

 3
Output 2:

 1


Example Explanation
Explanation 1:

Here we have 2 options:
1. A[1] and A[4] are both 1 so (1,4) is a special pair and |1-4|=3.
2. A[0] and A[5] are both 7 so (0,5) is a special pair and |0-5|=5.
Therefore the minimum possible distance is 3.
Explanation 2:

Only possibility is choosing A[1] and A[2].
=end
require 'pry'

class Solution
  # @param a : array of integers
  # @return an integer
  def solve(a)
    hash = {}
    a.each_with_index do |ele, idx|
      exists = hash[ele]
      if exists.nil?
        hash[ele] = { length: idx, found: false }
      else
        hash[ele] = { length: idx - hash[ele][:length], found: true } if hash[ele][:found] == false
      end
    end
    existing_value = hash.select { |key, value| value[:found] == true }.sort_by { |k, v| v[:length] }.first
    if existing_value.nil?
      return -1
    else
      existing_value[1][:length]
    end
  end
end

puts Solution.new.solve([1, 1, 1])