=begin
You are given an integer array A of length N comprising of 0's & 1's, and an integer B.

You have to tell all the indices of array A that can act as a center of 2 * B + 1 length 0-1 alternating subarray.

A 0-1 alternating array is an array containing only 0's & 1's, and having no adjacent 0's or 1's. For e.g. arrays
[0, 1, 0, 1], [1, 0] and [1] are 0-1 alternating, while [1, 1] and [0, 1, 0, 0, 1] are not.
Example Input
Input 1:

 A = [1, 0, 1, 0, 1]
 B = 1
Input 2:

 A = [0, 0, 0, 1, 1, 0, 1]
 B = 0


Example Output
Output 1:

 [1, 2, 3]
Output 2:

 [0, 1, 2, 3, 4, 5, 6]
=end

class Solution
  # @param a : array of integers
  # @param b : integer
  # @return an array of integers
  def solve(a, b)
    sub_array_size = (2 * b) + 1
    ans = []
    # sub_arrays = []
    for i in 0..a.length - sub_array_size
      # sub_arrays << a[i..(i + sub_array_size - 1)]
      alternating = false
      for j in i..(i + sub_array_size - 1)
        if j == i
          alternating = true
        else
          if a[j] == a[j - 1]
            alternating = false
            break
          end
        end
      end
      ans << i + b if alternating
    end
    return ans
  end
end

print Solution.new.solve([1, 0, 1, 0, 1], 1)
