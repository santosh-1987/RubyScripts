=begin
1. Given N elements (Distinct Elements)  Count the number of Noble Integers
   Noble Integer =  (Count of Elements < A[i])

2. Given an integer array A, find if an integer p exists in the array such that the number of integers greater than p in the array equals p.

Problem Constraints
1 <= |A| <= 2*105
1 <= A[i] <= 107

Input Format
First and only argument is an integer array A.

Output Format
Return 1 if any such integer p is present else, return -1.

Example Input
Input 1:

 A = [3, 2, 1, 3]
 O/P: 1
Input 2:

 A = [1, 1, 3, 3]

O/P: -1

Example Explanation
Explanation 1:

 For integer 2, there are 2 greater elements in the array..
Explanation 2:

 There exist no integer satisfying the required conditions.
=end
class Solution
  # @param a : array of integers
  # @return an integer
  def solve_less_than_element(array)
    array.sort!
    noble = false
    count = 0
    for index in 0...array.length
      if index == 0 && index == array[index]
        count += 1
        noble = true
      else
        prev_ele = array[index - 1]
        curr_ele = array[index]
        if index == curr_ele
          if prev_ele == curr_ele
            noble = false
          else
            count += 1
            noble = true
          end
        else
          if prev_ele == curr_ele && noble
            count += 1
            noble = true
          else
            noble = false
          end
        end
      end
    end
    return count == 0 ? -1 : count
  end

  def solve_greater_than_element(array)
    array.sort! { |x, y| y <=> x }
    noble = false
    count = 0
    puts "#{array}"
    for index in 0...array.length
      if index == 0 && index == array[index]
        count += 1
        noble = true
      else
        prev_ele = array[index - 1]
        curr_ele = array[index]
        if index == curr_ele
          if prev_ele == curr_ele
            noble = false
          else
            count += 1
            noble = true
          end
        else
          if prev_ele == curr_ele && noble
            count += 1
            noble = true
          else
            noble = false
          end
        end
      end
    end
    return count == 0 ? -1 : count
  end

  def solve_distinct_elements(a)
    a.sort!
    count = 0
    a.each_with_index do |ele, idx|
      count += 1 if ele == idx
    end
    return count
  end
end

puts Solution.new.solve_distinct_elements([1, -5, 3, 5, -10, 4])
puts Solution.new.solve_distinct_elements([-3, 0, 2, 5])
puts Solution.new.solve([-3, 0, 2, 2, 5, 5, 5, 5, 8, 8, 10, 10, 10, 14])
puts Solution.new.solve([-10, 1, 1, 1, 4, 4, 4, 7, 10])
puts Solution.new.solve_greater_than_element([5, 6, 2])
puts Solution.new.solve_greater_than_element([-1, -2, 0, 0, 0, -3])