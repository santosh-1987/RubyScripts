=begin
Given an array of positive integers A, two integers appear only once, and all the other integers appear twice.
Find the two integers that appear only once.

Input 1:
A = [1, 2, 3, 1, 2, 4] # O/P => [3,4]

Input 2:
A = [1, 2] # O/P => [1, 2]
https://www.scaler.com/academy/mentee-dashboard/class/19146/homework/problems/9184?navref=cl_tt_lst_nm
=end
require 'pry'

class Solution
  # @param a : array of integers
  # @return an array of integers
  def solve(a)
    xored = a.inject(:^)
    xored = xored & -xored

    result = [0, 0]
    for i in 0...a.length
      if (xored & a[i] != 0)
        result[1] ^= a[i];
      else
        result[0] ^= a[i];
      end
    end
    return result.sort
  end
end

puts "#{Solution.new.solve([186, 256, 102, 377, 186, 377])}"