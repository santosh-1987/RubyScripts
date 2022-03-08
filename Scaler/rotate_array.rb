class Solution
  # @param a : array of integers
  # @param b : array of integers
  # @return an array of array of integers
  def solve(a, b)
    output = []
    b.each do |k|
      pos = k % a.length
      if (pos == 0)
        output << arr
      else
        output << a[pos..-1] + a[0...pos]
      end
    end
    return output
  end
end

print Solution.new.solve([1, 2, 3, 4, 5], [2, 3])