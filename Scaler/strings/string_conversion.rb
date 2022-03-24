=begin
You are given a function to_lower() which takes a character array A as an argument.

Convert each character of A into lowercase character if it exists. If the lowercase of a character does not exist, it remains unmodified.
The uppercase letters from A to Z is converted to lowercase letters from a to z respectively.

Return the lowercase version of the given character array.

Problem Constraints
1 <= |A| <= 105

Input Format
Only argument is a character array A.

Output Format
Return the lowercase version of the given character array.

Example Input
Input 1:

 A = ['S', 'c', 'A', 'l', 'e', 'r', 'A', 'c', 'a', 'D', 'e', 'm', 'y']
Output 1:

 ['s', 'c', 'a', 'l', 'e', 'r', 'a', 'c', 'a', 'd', 'e', 'm', 'y']
Input 2:

 A = ['S', 'c', 'a', 'L', 'e', 'r', '#', '2', '0', '2', '0']
Output 2:

 ['s', 'c', 'a', 'l', 'e', 'r', '#', '2', '0', '2', '0']

Example Explanation
Explanation 1:

 All the characters in the returned array are in lowercase alphabets.
=end
require 'pry'

class Solution
  # @param a : array of characters
  # @return an array of characters
  def to_lower(a)
    lower = 'A'
    higher = 'Z'
    0.upto(a.length - 1).each do |idx|
      char = a[idx]
      if char >= lower && char <= higher
        a[idx] = (char.ord | (1 << 5)).chr
      end
    end
    return a
  end

  def to_upper(a)
    lower = 'a'
    higher = 'z'
    0.upto(a.length - 1).each do |idx|
      char = a[idx]
      if char >= lower && char <= higher
        a[idx] = (char.ord ^ (1 << 5)).chr
      end
    end
    return a
  end

  def is_alphanumeric(a)
    is_alphanumeric = 0
    for idx in 0...a.length
      char = a[idx]
      if char.ord >= 48 && char.ord <= 57
        is_alphanumeric = 1
      elsif char.ord >= 65 && char.ord <= 90
        is_alphanumeric = 1
      elsif char.ord >= 97 && char.ord <= 122
        is_alphanumeric = 1
      else
        is_alphanumeric = 0
        break
      end
    end
    return is_alphanumeric
  end
end

puts "#{Solution.new.to_lower(['S', 'c', 'a', 'L', 'e', 'r', '#', '2', '0', '2', '0'])}"
puts "#{Solution.new.to_upper(['S', 'c', 'a', 'L', 'e', 'r', '#', '2', '0', '2', '0'])}"
puts "#{Solution.new.is_alphanumeric(["s", "g", "7", "A", "d", "v", "t", "W", "4", "A", "4", "2", "8", "f", "h", "B", "p", "h", "7", "0", "v", "q", "w", "9", "o"])}"
