=begin
Write a recursive function that checks whether string A is a palindrome or Not.
Return 1 if the string A is a palindrome, else return 0.

Note: A palindrome is a string that's the same when read forward and backward.

Problem Constraints
1 <= A <= 50000

String A consists only of lowercase letters.

Input Format
The first and only argument is a string A.

Output Format
Return 1 if the string A is a palindrome, else return 0.

Example Input
Input 1:

 A = "naman"
Input 2:

 A = "strings"


Example Output
Output 1:

 1
Output 2:

 0

Example Explanation
Explanation 1:

 "naman" is a palindomic string, so return 1.
Explanation 2:

 "strings" is not a palindrome, so return 0.
=end
class Solution
  # @param a : string
  # @return an integer
  def solve(a)
    is_palliandrome(a, 0, a.length - 1)
  end

  def is_palliandrome(str, start_idx, end_idx)

    return true if start_idx > end_idx

    if str[start_idx] == str[end_idx]
      return is_palliandrome(str, start_idx + 1, end_idx - 1)
    end
    return false
  end
end

puts Solution.new.solve("naman")
