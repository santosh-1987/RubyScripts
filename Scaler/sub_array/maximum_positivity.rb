=begin
Given an array of integers A, of size N.

Return the maximum size subarray of A having only non-negative elements. If there are more than one such subarray, return the one having the smallest starting index in A.

NOTE: It is guaranteed that an answer always exists.

Input 1:

 A = [5, 6, -1, 7, 8]
Input 2:

 A = [1, 2, 3, 4, 5, 6]

Output 1:

 [5, 6]
Output 2:

 [1, 2, 3, 4, 5, 6]
=end

require 'pry'

class Solution
  # @param a : array of integers
  # @return an array of integers
  def solve(a)
    sub_arrays = []
    max_length_till_now = 0
    prev_negative_idx = -1
    a.each_with_index do |ele, idx|
      if ele < 0
        sa = idx - 1 < 0 ? [] : a[prev_negative_idx + 1..idx - 1]
        if max_length_till_now == sa.length
          sub_arrays << sa
        end
        if sa.length > max_length_till_now
          sub_arrays = [sa]
        end

        prev_negative_idx = idx
        max_length_till_now = sa.length > max_length_till_now ? sa.length : max_length_till_now
      end

      if (idx == a.length - 1 && ele > 0)
        sa = a[prev_negative_idx + 1..idx]
        if max_length_till_now == sa.length
          sub_arrays << sa
        end
        if sa.length > max_length_till_now
          sub_arrays = [sa]
        end
        max_length_till_now = sa.length
      end
    end
    return sub_arrays.first

  end
end

print Solution.new.solve([5, 6, -1, 7, 8])
puts
print Solution.new.solve([1, 2, 3, 4, 5])
puts
print Solution.new.solve([2, -1, 2, -1, 3, 5])
puts
print Solution.new.solve([ 8986143, -5026827, 5591744, 4058312, 2210051, 5680315, -5251946, -607433, 1633303, 2186575 ])
puts
print Solution.new.solve([ -3674875, 5305422, 7665178, 205505, -7168198, -1398091, 5392310, -1700856, 1259052, -3056006 ])
puts
print( Solution.new.solve([ -4549634, -3196682, 8455838, -1432628, -263819, -3928366, -5556259, -2114783, 3923939, -4183708 ]))