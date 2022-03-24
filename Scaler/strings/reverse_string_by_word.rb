=begin
You are given a string A of size N.

Return the string A after reversing the string word by word.

NOTE:

A sequence of non-space characters constitutes a word.
Your reversed string should not contain leading or trailing spaces, even if it is present in the input string.
If there are multiple spaces between words, reduce them to a single space in the reversed string.

Problem Constraints
1 <= N <= 3 * 105

Input Format
The only argument given is string A.

Output Format
Return the string A after reversing the string word by word.

Example Input
Input 1:
    A = "the sky is blue"

Output 1:
    "blue is sky the"
Input 2:
    A = "this is ib"
Output 2:
    "ib is this"

Example Explanation
Explanation 1:
    We reverse the string word by word so the string becomes "the sky is blue".
Explanation 2:
    We reverse the string word by word so the string becomes "this is ib".
=end
require 'pry'

class Solution
  # @param a : string
  # @return a string
  def solve(a)
    a.strip!
    reverse_string(a, a.length - 1, 0)
    i = 0
    j = 0
    0.upto(a.length - 1).each do |idx|
      # binding.pry
      if a[idx] != " " && idx != a.length - 1
        i += 1
      else
        idx == a.length - 1 ? reverse_string(a, i, j) : reverse_string(a, i - 1, j)
        i += 1
        j = i
      end
    end
    return a
  end

  def reverse_string(str, end_idx, start_idx)
    i = start_idx
    j = end_idx
    while i < j
      str[i], str[j] = str[j], str[i]
      i += 1
      j -= 1
    end
    return str
  end

end

puts Solution.new.solve("The Sun , rises in the East")
# puts Solution.new.solve("The East")
