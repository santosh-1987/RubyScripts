=begin
 Write a Custom Flatten method for a I/P Array
a = [1,2,[3,4]]
O/P: [1,2,3,4]
=end

def flatten(arr, results= [])
  arr.each do |ele|
    if ele.class == Array
      flatten(ele, results)
    else
      results << ele
    end
  end
  return results
end

puts "#{flatten([1,2,[3,4], [[[4,5]]]])}"