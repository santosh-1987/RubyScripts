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