=begin
Given a string A of size N consisting of lowercase alphabets.

You can change at most B characters in the given string to any other lowercase alphabet such that the number of distinct characters in the string is minimized.

Find the minimum number of distinct characters in the resulting string.

Problem Constraints

1 <= N <= 100000

0 <= B < N

Input Format

First argument is a string A.

Second argument is an integer B.



Output Format

Return an integer denoting the minimum number of distinct characters in the string.

Example Input

A = "abcabbccd"
B = 3



Example Output

2

Example Explanation

We can change both 'a' and one 'd' into 'b'.So the new string becomes "bbcbbbccb".
So the minimum number of distinct character will be 2.
=end

class Solution
  # @param a : string
  # @param b : integer
  # @return an integer
  def solve(a, b)
    char_count = {}
    for i in 0...a.length
      char_count[a[i]] = char_count[a[i]].nil? ? 1 : char_count[a[i]] + 1
    end
    char_count = Hash[char_count.sort_by { |_key, value| value }]

    char_count.each_pair do |key, value|
      if b > 0
        if b - value >= 0
          char_count.delete(key)
          b = b - value
        end
      else
        break
      end
    end

    return char_count.length
  end
end

puts Solution.new.solve("abcabbccd", 3)