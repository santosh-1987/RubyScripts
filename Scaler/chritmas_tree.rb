require 'pry'

class Solution
  # @param a : array of integers
  # @param b : array of integers
  # @return an integer
  def solve(a, b)
    min = nil
    for i in 0...a.length
      for j in i + 1...a.length
        for k in j + 1...a.length
          if (i < j && j < k && a[i] < a[j] && a[j] < a[k])
            cost = b[i] + b[j] + b[k]
            min = cost if min.nil?
            if cost < min
              min = cost
            end
          end
        end
      end
    end

    return min || -1
  end
end

puts Solution.new.solve([1, 3, 5], [1, 2, 3])
puts Solution.new.solve([ 5, 9, 10, 4, 7, 8 ], [ 5, 6, 4, 7, 2, 5 ])