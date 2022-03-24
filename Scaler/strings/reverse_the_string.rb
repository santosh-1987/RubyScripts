=begin
Given a string A, you are asked to reverse the string and return the reversed string.

Problem Constraints

1 <= |A| <= 105

String A consist only of lowercase characters.

Input Format

First and only argument is a string A.

Output Format

Return a string denoting the reversed string.

Example Input

Input 1:

 A = "scaler"
O/P:  "relacs"
Input 2:

 A = "academy"
O/P:  "ymedaca"

Example Explanation

Explanation 1:

 Reverse the given string.
=end
class Solution
  # @param a : string
  # @return a string
  def solve(a)
    i = 0
    j = a.length - 1
    while i < j
      a[i], a[j] = a[j], a[i]
      i += 1
      j -= 1
    end
    return  a
  end
end

puts Solution.new.solve("scaler")
puts Solution.new.solve("academy")