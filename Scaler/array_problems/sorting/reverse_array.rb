class Solution
  # @param a : constant array of integers
  # @return an array of integers
  def solve(a)

    left = 0
    right = a.length - 1

    while left < right
      a[left], a[right] = a[right], a[left]
      left += 1
      right -= 1
    end

    return a
  end
end

print Solution.new.solve([10, 1, 1,])
print Solution.new.solve([1, 2, 3, 2, 1])
print Solution.new.solve([1, 7, 3, 5])