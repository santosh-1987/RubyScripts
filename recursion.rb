class Recursion

  def self.sum_upto(num)
    return 0 if num == 0
    num + sum_upto(num-1)
  end

  def self.append(arr,n)
    return arr  if n < 0
    arr << n
    append(arr,n-1)
  end

  def self.reverse_append(arr,n)
    return if n < 0
    reverse_append(arr,n-1)
    arr << n
    return arr
  end
end

# puts Recursion.sum_upto(4)
puts Recursion.append([],7).inspect
puts Recursion.reverse_append([],10).inspect

