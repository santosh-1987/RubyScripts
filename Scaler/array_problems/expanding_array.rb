# You might have dealt with arrays in your day to day operation, but we will deal with a very special array in this task - Expanding array.
#
#   A expanding array is an array which has only distinct elements and keeps expanding based on the following process:
#
# Pick any 2 integers ( A and B, A > B ) randomly from the existing array. If integer part of A / B (lets call it Z) is not present in the array, we expand our original expanding array and add Z to it.
#   We keep repeating the above operation till there is no way to add a new number to this array or in other words, the array cannot expand further.
#
#   Using an array of elements, you have to create a new expanding array and return an integer which corresponds to the final size of the expanding array.
#
#   Example:
#
#   A = [9, 4]
# Return 3
# Explanation :
#
#   In first operation, you pick 9 and 4 and add 9 / 4 = 2 to the array. A = [9, 4, 2] Now, 4/2 = 2 which is already present in the array. Similarily, 9 / 2 = 4 which is also present in the array.
#
#   NOTE
#
# Your submission will be run on multiple test cases, so do take care of any global variables declared.
#   Assume that the size of the array will not be more than 500 and All the integers in the array will be smaller than or equal to 1000.
#
require 'pry'

class Solution
  # @param a : array of integers
  # @return an integer
  # def sizeExpandArray(a)
  #   a.sort! { |a, b| b <=> a }
  #   for i in 0...a.length
  #     for j in i + 1...a.length
  #       if a[i] > a[j] && a[j] != 0
  #         remainder = a[i] / a[j]
  #         unless a.include?(remainder)
  #           a << remainder
  #         end
  #       end
  #     end
  #   end
  #   binding.pry
  #   return a.length
  # end
  #
  def sizeExpandArray(a)
    a.sort! { |a, b| b <=> a }
    i = 0
    j = 1
    while i < a.length
      while j < a.length
        if a[i] > a[j] && a[j] != 0
          res = a[i] / a[j]
          unless a.include?(res)
            a << res
            a.sort! { |a, b| b <=> a }
          end
        end
      end
    end
    return a.length
  end
end

# puts Solution.new.sizeExpandArray([2, 9])
puts Solution.new.sizeExpandArray([1, 1])