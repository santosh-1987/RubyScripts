=begin
Problem Description
Surprisingly, in an alien language, they also use English lowercase letters, but possibly in a different order. The order of the alphabet is some permutation of lowercase letters.

Given an array of words A of size N written in the alien language, and the order of the alphabet denoted by string B of size 26, return 1 if and only if the given words are sorted lexicographically in this alien language else, return 0.

Problem Constraints
1 <= N, length of each word <= 105

Sum of the length of all words <= 2 * 106

Input Format
The first argument is a string array A of size N.

The second argument is a string B of size 26, denoting the order.

Output Format
Return 1 if and only if the given words are sorted lexicographically in this alien language else, return 0.

Example Input
Input 1:

 A = ["hello", "scaler", "interviewbit"]
 B = "adhbcfegskjlponmirqtxwuvzy"
Input 2:

 A = ["fine", "none", "no"]
 B = "qwertyuiopasdfghjklzxcvbnm"


Example Output
Output 1:

 1
Output 2:

 0

Example Explanation
Explanation 1:

 The order shown in string B is: h < s < i for the given words. So return 1.
Explanation 2:

 "none" should be present after "no". Return 0.
=end

class Solution
  # @param a : array of strings
  # @param b : string
  # @return an integer
  def solve(a, b)
    hash = {}
    0.upto(b.length - 1).each do |i|
      hash[b[i]] = i + 1
    end
    for i in 0...a.length - 1
      s1 = a[i]
      s2 = a[i + 1]
      if check(s1, s2, hash) == false
        return 0
      end
    end
    return 1
  end
end

def check(s1, s2, map)
  s1_length = s1.length
  s2_length = s2.length
  i = 0
  j = 0
  while i < s1_length && j < s2_length
    if map[s1[i]] < map[s2[j]]
      return true
    elsif map[s1[i]] > map[s2[j]]
      return false
    else
      i += 1
      j += 1
    end
  end
  return true if s1_length == s2_length
  return false
end

puts Solution.new.solve(["hello", "scaler", "interviewbit"], "adhbcfegskjlponmirqtxwuvzy")
puts Solution.new.solve(["fine", "none", "no"], "qwertyuiopasdfghjklzxcvbnm")