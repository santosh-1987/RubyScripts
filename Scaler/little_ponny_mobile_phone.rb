#Hey over here you need to use binary search to get ans.
# you need to create prefix array of A. And then for each value in B you can binary search over the prefix array to get the Ans
class Solution
  # @param a : array of integers
  # @param b : array of integers
  # @return an array of integers
  def solve(a, b)
    solution = []
    prefix_sum_arr = []
    prev = 0
    a.each do |ele|
      prefix_sum_arr << prev + ele
      prev += ele
    end

    b.each do |amount|
      location = search_max(prefix_sum_arr, amount)
      if location.nil?
        solution << 0
      else
        solution << a[0..location].count
      end
    end

    return solution
  end

  def search_max(array, element)
    start_index = 0
    end_index = array.length - 1
    location = nil

    while start_index <= end_index
      mid = (start_index + end_index) / 2
      if (array[mid] == element)
        location = mid
        break
      end

      if (element > array[mid])
        location = mid
        start_index = mid +1
      else
        end_index = mid -1
      end
    end
    return location
  end
end

print Solution.new.solve([3, 4, 4, 6], [20, 4, 10, 2])