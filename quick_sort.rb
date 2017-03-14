class Array
  def quicksort
    return [] if empty?
    puts self.inspect
    pivot = delete_at(rand(size))
    puts "pivot= #{pivot}"
    left, right = partition(&pivot.method(:>))
    puts "Left = #{left.inspect} , Right = #{right.inspect}"
    return *left.quicksort, pivot, *right.quicksort
  end
end


print [3,5,7,30,1,2,8,9,56,78].quicksort