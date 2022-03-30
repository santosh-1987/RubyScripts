=begin
Given a string A consisting of lowercase characters.

Check if characters of the given string can be rearranged to form a palindrome.

Return 1 if it is possible to rearrange the characters of the string A such that it becomes a palindrome else return 0.



Problem Constraints
1 <= |A| <= 105

A consists only of lower-case characters.



Input Format
First argument is an string A.



Output Format
Return 1 if it is possible to rearrange the characters of the string A such that it becomes a palindrome else return 0.



Example Input
Input 1:

 A = "abcde"
Input 2:

 A = "abbaee"


Example Output
Output 1:

 0
Output 2:

 1


Example Explanation
Explanation 1:

 No possible rearrangement to make the string palindrome.
Explanation 2:

 Given string "abbaee" can be rearranged to "aebbea" to form a palindrome.
=end
# require 'pry'
class Solution
  # @param a : string
  # @return an integer
  def solve(a)
    length = a.length
    return 1 if length == 1
    hash = {}
    ans = false
    for i in 0...length
      count = hash[a[i]]
      if count.nil?
        hash[a[i]] = 1
      else
        hash[a[i]] = count + 1
      end
    end
    # Length&1 == 0 is even 10 & 1 = 00
    puts hash
    if length & 1 == 0
      if hash.values.map { |number| number % 2 == 0 }.uniq.length == 1 && hash.length != a.length
        ans = true
      end
    else
      if hash.length == 1
        ans = true
      else
        if hash.values.select { |number| number.odd? }.count > 1
          ans = false
        else
          ans = true
        end
      end
    end

    return ans == true ? 1 : 0
  end
end

puts Solution.new.solve("rlsltxhororhfrhtamhasxfxmx")

#Solution Approach
# A set of characters can form a palindrome if at most one character occurs odd number of times and all characters occur even number of times.
#
#   We can do it in O(|A|) time using a count array.
#   Following are detailed steps.
#
#     Create a count array of alphabet size which is typically 26. Initialize all values of count array as 0.
#       Traverse the given string and increment count of every character.
#   Traverse the count array and if the count array has more than one odd values, return false. Otherwise return true.