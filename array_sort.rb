require "rubygems"
#require "pry"
=begin
 Sort a Given Array

 * Sort Comparing Array Indexes Greater Value- Bubble Sort

  [3,2,1,5]

[2,3,1,5]
[2,1,3,5]
[1,2,3,5]

=end
class ArraySort
  def initialize(arr =[])
    @array = arr
  end

  def sort(index_search=0)
    return @array if @array.empty?
    sorted = false
    @array.each_with_index do |element,index |
      compare_element = @array[index_search+1]
      break if compare_element.nil?
      if element > compare_element
        construct_array(index_search+1,index)
      else
        index_search+=1
      end
    end
    return @array
  end

  def construct_array(old_index,new_index)
    # Move Old Index to New Index
    @array[new_index],@array[old_index] = @array[old_index],@array[new_index]
    p @array
    sort()
  end
end

p array=[3,1,6,0,6,4,23,56,78,34,21,67,8,1,34,3,56,90,32]
# array=[3,1,6]
arr_sort = ArraySort.new(array)
p arr_sort.sort
