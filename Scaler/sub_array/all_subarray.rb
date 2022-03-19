=begin
Print all Sub arrays for a Given Array
=end

class SubArray
  def self.all_of(arr)
    sub_arrays = []
    for i in 0...arr.length
      for j in i...arr.length
        sub_arrays << arr[i..j]
      end
    end
    return sub_arrays
  end
end

# puts "#{SubArray.all_of([1,0,1])}"
puts "#{SubArray.all_of([0,1,1,0,0,1,0])}"
# puts SubArray.all_of([ 0, 1, 0, 1, 1, 1, 0, 0, 1, 1, 1, 1, 1, 0, 1, 0, 1, 1, 1, 0, 1, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 0, 1, 1, 0, 1, 1, 1, 0, 1, 1, 0, 0, 1, 0, 0, 1, 0, 1, 1, 0, 1, 1, 0, 0, 1, 1, 1, 0, 0, 0, 1, 1, 1, 1, 0, 1, 1, 1, 0, 0, 1, 0, 0, 0, 1 ]).reject { |arr| arr.inject(:|) == 0 }.count
