def merge_sort arr
  return arr if arr.length == 1
  midpoint = (arr.length - 1)/2

  arr_1 = merge_sort(arr[0..midpoint])
  arr_2 = merge_sort(arr[(midpoint+1)..(arr.length-1)])
  return merge(arr_1, arr_2)
end

def merge arr_1, arr_2
  puts "Called Me with #{arr_1.inspect} & #{arr_2.inspect}"
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


arr = [2, 7, 3, 4, 5, 6, 3, 2, 2, 5, 6, 7, 7]
print merge_sort arr