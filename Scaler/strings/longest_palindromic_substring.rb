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
    starting = 0
    ending = 0
    for i in 0...a.length
      firstodd, lastodd = get_paliandrome_indexes(a, i, i)
      firsteven, lasteven = get_paliandrome_indexes(a, i, i + 1)
      # puts "firstodd: #{firstodd},lastodd: #{lastodd},firsteven: #{firsteven},lasteven: #{lasteven}"
      if firsteven.nil? && firstodd.nil?
        continue
      elsif firsteven.nil?
        if lastodd - firstodd > ending - starting
          starting = firstodd
          ending = lastodd
        end
      elsif firstodd.nil?
        if lasteven - firsteven > ending - starting
          starting = firsteven
          ending = lasteven
        end
      elsif lasteven - firsteven > lastodd - firstodd
        if lasteven - firsteven > ending - starting
          starting = firsteven
          ending = lasteven
        end
      else
        if lastodd - firstodd > ending - starting
          starting = firstodd
          ending = lastodd
        end
      end
    end
    return a[starting..ending]
  end

  def get_paliandrome_str(str, starting, ending)
    # puts "#{str}, #{starting}, #{ending}"
    new_str = ''
    while starting >= 0 && ending < str.length && str[starting] == str[ending]
      if starting == ending
        new_str << str[ending]
      else
        new_str.prepend(str[starting])
        new_str << str[ending]
      end
      # new_str = str[starting..ending]
      # binding.pry if new_str == "aaabaaa"
      starting -= 1
      ending += 1
    end
    # puts new_str
    return new_str
  end

  def get_paliandrome_indexes(str, starting, ending)
    # puts "Initial starting:#{starting}, ending: #{ending}"
    valid = false
    while starting >= 0 && ending < str.length && str[starting] == str[ending]
      valid = true
      starting -= 1
      ending += 1
    end
    if valid == true
      starting = starting + 1
      ending = ending - 1
    else
      starting = nil
      ending = nil
    end
    return starting, ending
  end

  def get_paliandrome_length(str, starting, ending)
    while starting > 0 && ending < str.length && str[starting] == str[ending]
      starting -= 1
      ending += 1
    end
    return ending - starting - 1
  end

end

puts Solution.new.longestPalindrome_string("amazonin")
puts Solution.new.longestPalindrome_string("aaaabaaa")
puts Solution.new.longestPalindrome_string("amazoninotit")
puts Solution.new.longestPalindrome_string("abbcccbbbcaaccbababcbcabca")
puts Solution.new.longestPalindrome_string("bbacaccaabcbaccbcacacabcbcbbbcbbbccabcbccacbacbbaacbbbcbbaabbbcabcabccaacbcccaabaccacabaccabbcacbc")

=begin
Accepted Solution in Online IDE
class Solution
    # @param a : string
    # @return a string
    def longestPalindrome(a)
        ans = ""
        starting = 0
        ending = 0
        for i in 0...a.length
        firstodd, lastodd = get_paliandrome_indexes(a, i, i)
        firsteven, lasteven = get_paliandrome_indexes(a, i, i + 1)
        # puts "firstodd: #{firstodd},lastodd: #{lastodd},firsteven: #{firsteven},lasteven: #{lasteven}"
        if firsteven.nil? && firstodd.nil?
            continue
        elsif firsteven.nil?
            if lastodd - firstodd > ending - starting
            starting = firstodd
            ending = lastodd
            end
        elsif firstodd.nil?
            if lasteven - firsteven > ending - starting
            starting = firsteven
            ending = lasteven
            end
        elsif lasteven - firsteven > lastodd - firstodd
            if lasteven - firsteven > ending - starting
            starting = firsteven
            ending = lasteven
            end
        else
            if lastodd - firstodd > ending - starting
            starting = firstodd
            ending = lastodd
            end
        end
        end
        return a[starting..ending]
    end

    def get_paliandrome_indexes(str, starting, ending)
        # puts "Initial starting:#{starting}, ending: #{ending}"
        valid = false
        while starting >= 0 && ending < str.length && str[starting] == str[ending]
        valid = true
        starting -= 1
        ending += 1
        end
        if valid == true
        starting = starting + 1
        ending = ending - 1
        else
        starting = nil
        ending = nil
        end
        return starting, ending
  end
end

=end
