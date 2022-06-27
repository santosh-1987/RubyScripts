require 'pry'
# arr = [2,3,12,30,34,1]
# Find leading number to right
# [1] # 1
# [1,2]. # 2
#   [1,3,2] # 3,2
# [1,7,5,2] # 7,5,2
# [7,7,5,2]
#
# [2,3,12,30,34,1]
# [34,34,34,34,1]
#
class Solution
  # @param a : array of integers
  # @return an array of integers
  def solve(a)
    max_till_now = a[-1]
    solution = [max_till_now]
    (a.length - 2).downto(0).each do |idx|
      ele = a[idx]
      if ele > max_till_now
        solution << ele
        max_till_now = ele
      end
    end

    return solution
  end
end

print Solution.new.solve([16, 17, 4, 3, 5, 2])