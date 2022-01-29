#Hey over here you need to use binary search to get ans.
# you need to create prefix array of A. And then for each value in B you can binary search over the prefix array to get the Ans
class Solution
  # @param a : array of integers
  # @param b : array of integers
  # @return an array of integers
  def solve(a, b)
    solution = []
    b.each do |amount|
      count = 0
      a.each do |model_price|
        if amount - model_price >= 0
          amount = amount - model_price
          count += 1
        else
          break
        end
      end
      solution << count
    end
    return solution
  end
end

print Solution.new.solve([3, 4, 4, 6], [20, 4, 10, 2])