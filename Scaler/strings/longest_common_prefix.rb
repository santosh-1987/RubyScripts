=begin
Given the array of strings A, you need to find the longest string S, which is the prefix of ALL the strings in the array.

The longest common prefix for a pair of strings S1 and S2 is the longest string S which is the prefix of both S1 and S2.

Example: the longest common prefix of "abcdefgh" and "abcefgh" is "abc".

Problem Constraints
0 <= sum of length of all strings <= 1000000


Input Format
The only argument given is an array of strings A.

Output Format
Return the longest common prefix of all strings in A.

Example Input
Input 1:

A = ["abcdefgh", "aefghijk", "abcefgh"]
Input 2:

A = ["abab", "ab", "abcd"];


Example Output
Output 1:

"a"
Output 2:

"ab"


Example Explanation
Explanation 1:

Longest common prefix of all the strings is "a".
Explanation 2:

Longest common prefix of all the strings is "ab".
=end
require 'pry'

class Solution
  # @param a : array of strings
  # @return a string
  def longestCommonPrefix(a)
    #Sort the array based on length to get the minimum length string
    a.sort! { |x, y| x.length <=> y.length }
    prefix_str = ""
    #return the first string if the length is 1 or the first element is empty string
    return a[0] if a[0] == "" || a.length == 1
    # Return Empty string if the first char of index 0 & 1 doesn't match
    if a[0][0] != a[1][0]
      return prefix_str
    end

    for i in 0...a[0].length
      prefix = true
      obreak = false
      for j in 1...a.length
        if a[0][i] != a[j][i]
          prefix = false
          obreak = true
          break
        end
      end
      prefix_str << a[0][i] if prefix
      break if obreak
    end
    return prefix_str
  end
end

puts Solution.new.longestCommonPrefix(["abcdefgh", "abcfghijk", "abcefgh", "we"])
