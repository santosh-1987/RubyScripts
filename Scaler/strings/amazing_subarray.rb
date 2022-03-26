=begin
You are given a string S, and you have to find all the amazing substrings of S.

An amazing Substring is one that starts with a vowel (a, e, i, o, u, A, E, I, O, U).

Input

Only argument given is string S.
Output

Return a single integer X mod 10003, here X is the number of Amazing Substrings in given the string.
Constraints

1 <= length(S) <= 1e6
S can have special characters
Example

Input
    ABEC

Output
    6

Explanation
    Amazing substrings of given string are :
    1. A
    2. AB
    3. ABE
    4. ABEC
    5. E
    6. EC
    here number of substrings are 6 and 6 % 10003 = 6.
=end
require 'pry'
class Solution
  # @param a : string
  # @return an integer
  def solve(a)
    # count_vowels = 0
    ans = 0

    a.split("").each_with_index do |ele,index|
      if ['a','e','i','o','u'].include?(ele.downcase)
        ans += a.length - index
      end
    end

    return ans%10003

  end
end

puts Solution.new.solve("ABEC")