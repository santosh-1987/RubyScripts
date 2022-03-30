=begin
Given a number A, find if it is COLORFUL number or not.

If number A is a COLORFUL number return 1 else, return 0.

What is a COLORFUL Number:

A number can be broken into different contiguous sub-subsequence parts.
Suppose, a number 3245 can be broken into parts like 3 2 4 5 32 24 45 324 245.
And this number is a COLORFUL number, since product of every digit of a contiguous subsequence is different.


Problem Constraints
1 <= A <= 2 * 109



Input Format
The first and only argument is an integer A.



Output Format
Return 1 if integer A is COLORFUL else return 0.



Example Input
Input 1:

 A = 23
Input 2:

 A = 236


Example Output
Output 1:

 1
Output 2:

 0


Example Explanation
Explanation 1:

 Possible Sub-sequences: [2, 3, 23] where
 2 -> 2
 3 -> 3
 23 -> 6  (product of digits)
 This number is a COLORFUL number since product of every digit of a sub-sequence are different.
Explanation 2:

 Possible Sub-sequences: [2, 3, 6, 23, 36, 236] where
 2 -> 2
 3 -> 3
 6 -> 6
 23 -> 6  (product of digits)
 36 -> 18  (product of digits)
 236 -> 36  (product of digits)
 This number is not a COLORFUL number since the product sequence 23  and sequence 6 is same.
=end
require 'pry'
require 'set'

class Solution
  # @param a : integer
  # @return an integer
  def colorful(a)
    return 1 if (0..9).include?(a)
    set = Set.new
    ans = 1
    prev_key = -1
    while a > 0
      digit = a % 10
      a = a / 10
      return 0 if digit == 0 || digit == 1

      return 0 if set.include?(digit)
      set.add(digit)

      return 0 if prev_key > 0 && set.include?(prev_key * digit)
      set.add(prev_key > 0 ? prev_key * digit : -1*prev_key * digit)
      prev_key = digit
    end

    return ans
  end
end

puts Solution.new.colorful(236)