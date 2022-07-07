=begin
Selection Sort Algorithm selects the minimum element from current index and swaps till all elements are sorted.

TC: O(N^2)
Unstable Sorting Algorithm
=end
require 'pry'

class Array
  def self.selection_sort(arr)
    for i in 0...arr.length - 1
      min_index = nil
      minimum = arr[i]
      for j in i + 1...arr.length
        curr_element = arr[i]
        if arr[j] < curr_element && arr[j] < minimum
          min_index = j
          minimum = arr[j]
        end
      end
      arr[i], arr[min_index] = arr[min_index], arr[i] unless min_index.nil?
    end
    return arr
  end

  def self.bubble_sort(arr)
    n = arr.length
    for i in 0...(n - 1)
      flag = false
      for j in 0...(n - i - 1) # n - i - 1 because in subsequent steps we get the greatest element in the last index , so no need of going till last index
        if (arr[j] > arr[j + 1])
          arr[j], arr[j + 1] = arr[j + 1], arr[j]
        end
      end
      # print arr # Uncomment if you want to see the step wise sort
      # puts
      break if flag
    end
    return arr
  end

  def self.merge_sort arr
    return arr if arr.length == 1
    midpoint = (arr.length - 1)/2
    puts "arr: #{arr}"
    arr_1 = merge_sort(arr[0..midpoint])
    arr_2 = merge_sort(arr[(midpoint+1)..(arr.length-1)])
    puts "---- Calling: arr1: #{arr_1}, arr2: #{arr_2}"
    return merge(arr_1, arr_2)
  end

  def self.merge arr_1, arr_2
    arr = []
    while arr_1.length > 0 && arr_2.length > 0
      if arr_1[0] < arr_2[0]
        arr.push(arr_1.shift)
      else
        arr.push(arr_2.shift)
      end
    end
    arr.push(arr_1).flatten! if arr_1.length > 0
    arr.push(arr_2).flatten! if arr_2.length > 0
    return arr
  end
end

# print Array.bubble_sort([3, 7, 1, 16, 5, -2, 8])
# print Array.bubble_sort([2, 1, 5, 3, 4])
# print Array.bubble_sort([-1, 1, 8, 2, 3])
# print Array.merge_sort([3, 7, 1, 16, 5, -2, 8])
