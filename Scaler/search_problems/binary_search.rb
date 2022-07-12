# Binary Search for an index in sorted array
require 'pry'

class BSearch
  def self.index_of(arr, element)
    left = 0
    right = arr.length - 1
    found = -1
    while (left <= right)
      mid = (left + right) / 2
      if arr[mid] == element
        found = mid
      end
      break if found > -1

      if arr[mid] > element
        right = mid - 1
      else
        left = mid + 1
      end
    end
    return found
  end
end

puts BSearch.index_of([1, 2, 3, 4, 5], 3)
puts BSearch.index_of([1, 2, 3, 4, 5], 1)
puts BSearch.index_of([1, 2, 3, 4, 5], 5)
puts BSearch.index_of([1, 2, 3, 4, 5], 8)