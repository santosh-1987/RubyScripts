=begin
Given a string A of size N, find and return the longest palindromic substring in A.

Substring of string A is A[i...j] where 0 <= i <= j < len(A)

Palindrome string:
A string which reads the same backwards. More formally, A is palindrome if reverse(A) = A.

Incase of conflict, return the substring which occurs first ( with the least starting index).

Problem Constraints

1 <= N <= 10000

Input Format

First and only argument is a string A.

Output Format

Return a string denoting the longest palindromic substring of string A.

Input
A = "aaaabaaa"
Output

"aaabaaa"

Explanation

We can see that longest palindromic substring is of length 7 and the string is "aaabaaa".
=end
require 'pry'

class Solution
  # @param a : string
  # @return a string
  def longestPalindrome(a)
    ans = 1
    for i in 0...a.length
      length1 = get_paliandrome_length(a, i, i)
      length2 = get_paliandrome_length(a, i, i + 1)
      max_length = length1 > length2 ? length1 : length2
      ans = ans > max_length ? ans : max_length
    end
    return ans
  end

  def longestPalindrome_string(a)
    ans = ""
    for i in 0...a.length
      str1 = get_paliandrome_str(a, i, i)
      str2 = get_paliandrome_str(a, i, i + 1)
      str = str1.length > str2.length ? str1 : str2
      ans = ans.length >= str.length ? ans : str
    end
    return ans
  end

  def get_paliandrome_str(str, starting, ending)
    new_str = ''
    while starting >= 0 && ending < str.length && str[starting] == str[ending]
      new_str = str[starting..ending]
      starting -= 1
      ending += 1
    end
    return new_str
  end

  def get_paliandrome_length(str, starting, ending)
    while starting > 0 && ending < str.length && str[starting] == str[ending]
      starting -= 1
      ending += 1
    end
    return ending - starting - 1
  end

end

puts Solution.new.longestPalindrome_string("aaaabaaa")
puts Solution.new.longestPalindrome_string("amazonin")
