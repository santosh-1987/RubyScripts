require 'pry'
class Solution
  # @param a : array of integers
  # @return an array of integers
  def solve(a)
    max_till_now = a[-1]
    solution = [max_till_now]
    (a.length-2).downto(0).each do |idx|
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