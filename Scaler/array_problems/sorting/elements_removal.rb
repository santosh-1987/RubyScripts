=begin
Given an integer array A of size N. You can remove any element from the array in one operation.
The cost of this operation is the sum of all elements in the array present before this operation.

Find the minimum cost to remove all elements from the array.

Problem Constraints
0 <= N <= 1000
1 <= A[i] <= 103

Input Format
First and only argument is an integer array A.

Output Format
Return an integer denoting the total cost of removing all elements from the array.

Example Input
Input 1:

 A = [2, 1]

Output 1:

 4
Input 2:

 A = [5]

Output 2:

 5


Example Explanation
Explanation 1:

 Given array A = [2, 1]
 Remove 2 from the array => [1]. Cost of this operation is (2 + 1) = 3.
 Remove 1 from the array => []. Cost of this operation is (1) = 1.
 So, total cost is = 3 + 1 = 4.

Tricks:
- Sort the array in descending order so that the highest valued element comes first and is counted only once.
- OR use Prefix Sum techniq to find the sum
example:

[a, b , c]

a + b + c
    b + c
        c
1a + 2b + 3c

Cost = arr[i] * (i+1)
=end

class Solution
  # @param a : array of integers
  # @return an integer
  def solve(a)
    cost = 0
    # Sort Descending
    a.sort! { |x, y| y <=> x }
    for i in 0...a.length
      #1st element 1 time, 2nd element  twice , 3rd element thrice and so on
      cost += a[i] * (i + 1)
    end
    return cost
  end
end

puts Solution.new.solve([2, 1])