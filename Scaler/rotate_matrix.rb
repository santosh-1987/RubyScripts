=begin
You are given a n x n 2D matrix A representing an image.

Rotate the image by 90 degrees (clockwise).

You need to do this in place.

Note: If you end up using an additional array, you will only receive partial score.
=end
require 'pry'

class Solution
  # @param a : array of array of integers
  def solve(a)
    # Transpose
    for i in (0...a.length)
      for j in (i...a[i].length)
        temp = a[i][j]
        a[i][j] = a[j][i]
        a[j][i] = temp
      end
    end
    # REVERSE
    for i in (0...a.length)
      li = 0
      ri = a[i].length - 1

      while li < ri
        temp = a[i][li]
        a[i][li] = a[i][ri]
        a[i][ri] = temp

        li += 1
        ri -= 1
      end
    end
    a
  end
end

print Solution.new.solve([[1, 2, 3], [4, 5, 6], [7, 8, 9]])
# print Solution.new.solve([["A", "B"], [3, 4]])

# A B
# 3 4
