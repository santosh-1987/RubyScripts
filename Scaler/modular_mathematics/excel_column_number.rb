=begin
Given a column title as appears in an Excel sheet, return its corresponding column number.
Example Input
Input 1:
 AB
Input 2:
 ABCD
Example Output
Output 1:
28
Output 2:
19010
 A -> 1
 B -> 2
 C -> 3
 ...
 Z -> 26
 AA -> 27
 AB -> 28

=end
require 'pry'
class Solution
  # @param a : string
  # @return an integer
  def titleToNumber(a)
    chars = Hash[('A'..'Z').to_a.zip(1..26).to_a]
    sum = 0
    count = a.length - 1
    a.split("").each do |ele|
      sum += chars[ele] * power(26, count)
      count -= 1
    end
    return sum
  end

  def power(a, b)
    count = 1
    1.upto(b) do |_|
      count *= a
    end
    return count
  end
end

puts Solution.new.titleToNumber("ABC")
