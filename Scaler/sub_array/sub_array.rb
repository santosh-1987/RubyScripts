# Given an array A of N non-negative numbers and a non-negative number B,
# you need to find the number of subarrays in A with a sum less than B.
# We may assume that there is no overflow.
#Example Input
# Input 1:
#
#  A = [2, 5, 6]
#  B = 10
# Input 2:
#
#  A = [1, 11, 2, 3, 15]
#  B = 10
#
#
# Example Output
# Output 1:
#
#  4
# Output 2:
#
#  4

class Solution
  # @param a : array of integers
  # @param b : integer
  # @return an integer
  def solve(a, b)
    count = 0
    ps = [a[0]]
    for i in 1...a.length
      ps << ps[i - 1] + a[i]
    end

    for i in 0...a.length
      for j in i...a.length
        l = i
        r = j
        sum = l == 0 ? ps[r - l] : ps[r] - ps[(l - 1)]
        length = l == 0 ? r - l+1 : r - (l - 1)
        # puts "#{r}, #{l} , #{length}, #{a[l..r]}"
        if length%2 == 0
          count += 1 if sum < b
        else
          count += 1 if sum > b
        end

      end
    end

    return count
  end
end

puts Solution.new.solve([1, 2, 3, 4, 5], 4)
# puts Solution.new.solve([13, 16, 16, 15, 9, 16, 2, 7, 6, 17, 3, 9],65)