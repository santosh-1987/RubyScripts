=begin
Problem Description
Farmer John has built a new long barn with N stalls. Given an array of integers A of size N where each element of the array represents the location of the stall and an integer B which represents the number of cows.

His cows don't like this barn layout and become aggressive towards each other once put into a stall. To prevent the cows from hurting each other, John wants to assign the cows to the stalls, such that the minimum distance between any two of them is as large as possible. What is the largest minimum distance?

Problem Constraints
2 <= N <= 100000
0 <= A[i] <= 109
2 <= B <= N

Input Format
The first argument given is the integer array A.
The second argument given is the integer B.

Output Format
Return the largest minimum distance possible among the cows.


Example Input
Input 1:

A = [1, 2, 3, 4, 5]
B = 3
Input 2:

A = [1, 2]
B = 2


Example Output
Output 1:

 2
Output 2:

 1


Example Explanation
Explanation 1:

 John can assign the stalls at location 1, 3 and 5 to the 3 cows respectively. So the minimum distance will be 2.
Explanation 2:

 The minimum distance will be 1.
=end

require 'pry'

class Solution
  # @param a : array of integers
  # @param b : integer
  # @return an integer
  def solve(a, b)
    a.sort!
    left = 1
    right = a[a.length - 1] - a[0]
    ans = 0;
    while (left <= right)
      mid = (left + right) >> 1 # same as (hi+lo)/2
      if (checkCowsPlacedAtMidAPart(a, mid, b))
        ans = mid
        left = mid + 1
      else
        right = mid - 1
      end
    end
    return ans

  end

  def checkCowsPlacedAtMidAPart(a, mid, b)
    cowsplaced = a[0]
    cowsCount = 1
    for i in 1...a.length
      if (a[i] - cowsplaced >= mid)
        cowsCount += 1
        cowsplaced = a[i]
        if (cowsCount == b)
          return true;
        end
      end
    end
    return false
  end

end

puts Solution.new.solve([1, 2, 3, 4, 5], 3)