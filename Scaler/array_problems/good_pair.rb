=begin
Problem Description

Given an array A and an integer B. A pair(i, j) in the array is a good pair if i != j and (A[i] + A[j] == B). Check if any good pair exist or not.

Problem Constraints
1 <= A.size() <= 104
1 <= A[i] <= 109
1 <= B <= 109

Input Format
First argument is an integer array A.
Second argument is an integer B.

Output Format : Return 1 if good pair exist otherwise return 0.



Example Input
Input 1:
A = [1,2,3,4]
B = 7
Output :1

Input 2:

A = [1,2,4]
B = 4
Output :0

Input 3:

A = [1,2,2]
B = 4
Output :1

Example Explanation

Explanation 1:

 (i,j) = (3,4)
Explanation 2:

No pair has sum equal to 4.
Explanation 3:

 (i,j) = (2,3)
=end
require 'set'
require 'pry'

class Solution
  # @param a : array of integers
  # @param b : integer
  # @return an integer
  def solve(a, b)
    found = 0
    ob = false
    for i in (0...(a.length))
      for j in (i + 1...(a.length))
        if a[i] + a[j] == b
          found = 1
          ob = true
          break
        end
      end
      break if ob == true
    end

    return found
  end

  def set_solution(a, b)
    set = Set.new
    found = 0
    a.each do |ele|
      find = b - ele
      if set.include?(find)
        found = 1
        break
      end
      if !set.include?(ele)
        set.add(ele)
      end
    end
    return found
  end
end

puts Solution.new.set_solution([1, 2, 4], 5)
