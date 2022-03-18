=begin
There are certain problems which are asked in the interview to also check how you take care of overflows in your problem.
This is one of those problems.
Please take extra care to make sure that you are type-casting your ints to long properly and at all places. Try to verify if your solution works if number of elements is as large as 105

Food for thought :

Even though it might not be required in this problem, in some cases, you might be required to order the operations cleverly so that the numbers do not overflow.
For example, if you need to calculate n! / k! where n! is factorial(n), one approach is to calculate factorial(n), factorial(k) and then divide them.
Another approach is to only multiple numbers from k + 1 ... n to calculate the result.
Obviously approach 1 is more susceptible to overflows.
You are given a read only array of n integers from 1 to n.

Each integer appears exactly once except A which appears twice and B which is missing.

Return A and B.

Note: Your algorithm should have a linear runtime complexity. Could you implement it without using extra memory?

Note that in your output A should precede B.

Example:

Input:[3 1 2 5 3]

Output:[3, 4]

A = 3, B = 4

https://www.scaler.com/academy/mentee-dashboard/class/19149/homework/problems/60/submissions
Approach:

Find Sum of array and actual sum using n natural number n(n+1)/2
Find Sum of Square of elements of array
3+1+2+5+3-b+a = actual_sum # a-b = actual sum - sum
3^2+1^2+2^2+5^2+3^2-b^2+a^2 = Sum of Square of elements of array
a^2-b^2 = (a+b)(a-b)
derive a & b
=end
require 'pry'

class Solution
  # @param a : constant array of integers
  # @return an array of integers
  def repeatedNumber(a)
    length = a.length
    sum_of_elements = 0
    square_sum = 0
    a.each do |ele|
      sum_of_elements += ele
      square_sum += ele * ele
    end
    actual_sum = (length * (length + 1)) / 2
    actual_square_sum = ((length * (length + 1)) * (2 * length + 1)) / 6
    difference = actual_sum - sum_of_elements # a - b
    square_diff = actual_square_sum - square_sum
    duplicate_missing_sum = square_diff / difference # a+b
    missing = (duplicate_missing_sum - difference) / 2
    duplicate = duplicate_missing_sum - missing
    return [missing, duplicate]
  end
end

# print Solution.new.repeatedNumber([3, 1, 2, 5, 3])
print Solution.new.repeatedNumber([1, 2, 2, 3, 4])
