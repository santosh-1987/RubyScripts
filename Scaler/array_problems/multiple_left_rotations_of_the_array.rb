=begin
Given an array of integers A and multiple values in B, which represents the number of times array A needs to be left rotated.

Find the rotated array for each value and return the result in the from of a matrix where ith row represents the rotated array for the ith value in B.
Problem Description

Given an array of integers A and multiple values in B, which represents the number of times array A needs to be left rotated.

Find the rotated array for each value and return the result in the from of a matrix where ith row represents the rotated array for the ith value in B.



Problem Constraints

1 <= length of both arrays <= 2000 -10^9 <= A[i] <= 10^9 0 <= B[i] <= 2000


Input Format

The first argument given is the integer array A.
The second argument given is the integer array B.


Output Format

Return the resultant matrix.


Example Input

Input 1:

    A = [1, 2, 3, 4, 5]
    B = [2, 3]

Input 2:


    A = [5, 17, 100, 11]
    B = [1]




Example Output

Output 1:

    [ [3, 4, 5, 1, 2]
     [4, 5, 1, 2, 3] ]


Output 2:


    [ [17, 100, 11, 5] ]



Example Explanation

for input 1 -> B[0] = 2 which requires 2 times left rotations

1: [2, 3, 4, 5, 1]

2: [3, 4, 5, 1, 2]

B[1] = 3 which requires 3 times left rotation

1: [2, 3, 4, 5, 1]

2: [3, 4, 5, 1, 2]

2: [4, 5, 1, 2, 4]
=end
class Solution
  # @param a : array of integers
  # @param b : array of integers
  # @return an array of array of integers
  def solve(a, b)
    output = []
    b.each do |k|
      pos = k % a.length
      if (pos == 0)
        output << a
      else
        output << a[pos..-1] + a[0...pos]
      end
    end
    return output
  end

  # Given an integer array A of size N and an integer B, you have to print the same array after rotating it B times towards the right.
  def rotate_right(a, b)
    rotate_mod = b % a.length
    return a if rotate_mod == 0

    return a.last(rotate_mod) + a.first(a.length-rotate_mod)
  end
end

puts "#{Solution.new.rotate_right([1, 2, 3, 4], 1)}"
puts "#{Solution.new.rotate_right([1, 2, 3, 4], 2)}"
puts "#{Solution.new.rotate_right([1, 2, 3, 4], 3)}"
puts "#{Solution.new.rotate_right([1, 2, 3, 4], 4)}"
