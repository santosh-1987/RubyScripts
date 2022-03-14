=begin
You are given a 2D integer matrix A, make all the elements in a row or column zero if the A[i][j] = 0. Specifically, make entire ith row and jth column zero.
Problem Constraints
1 <= A.size() <= 103
1 <= A[i].size() <= 103
0 <= A[i][j] <= 103

Input Format

First argument is a vector of vector of integers.(2D matrix).
Output Format
Return a vector of vector after doing required operations.
Example Input
Input 1:
[1,2,3,4]
[5,6,7,0]
[9,2,0,4]
Example Output

Output 1:
[1,2,0,0]
[0,0,0,0]
[0,0,0,0]

Example Explanation

Explanation 1:

A[2][4] = A[3][3] = 0, so make 2nd row, 3rd row, 3rd column and 4th column zero.
=end

require 'pry'

class Solution
  # @param a : array of array of integers
  # @return an array of array of integers
  def solve(a)
    indexes_with_zero = []
    for i in 0...a.length
      for j in 0...a[0].length
        if a[i][j] == 0
          indexes_with_zero << [i, j]
        end
      end
    end
    indexes_with_zero.each do |ele|
      i, j = ele
      a[i] = [0] * a[i].length
      for k in 0...a.length
        a[k][j] = 0
      end
    end
    return a
  end
end

a = [
  [1, 2, 3, 4],
  [5, 6, 7, 0],
  [9, 2, 0, 4]
]

b = [
  [97, 18, 55, 1, 50, 17, 16, 0, 22, 14],
  [58, 14, 75, 54, 11, 23, 54, 95, 33, 23],
  [73, 11, 2, 80, 6, 43, 67, 82, 73, 4],
  [61, 22, 23, 68, 23, 73, 85, 91, 25, 7],
  [6, 83, 22, 81, 89, 85, 56, 43, 32, 89],
  [0, 6, 1, 69, 86, 7, 64, 5, 90, 37],
  [10, 3, 11, 33, 71, 86, 6, 56, 78, 31],
  [16, 36, 66, 90, 17, 55, 27, 26, 99, 59],
  [67, 18, 65, 68, 87, 3, 28, 52, 9, 70],
  [41, 19, 73, 5, 52, 96, 91, 10, 52, 21]
]
print Solution.new.solve(b)