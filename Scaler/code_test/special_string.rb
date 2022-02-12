require 'pry'

class Solution
  # @param a : string
  # @return a string
  def solve(a)
    ans = 'Yes'
    can_a_appear = true
    can_b_appear = false
    (0...a.length).each do |index|
      # if first character doesnt start with a break
      if a[index] != 'a' && index == 0
        ans = 'No'
        break
      end

      if !['a', 'b'].include? a[index]
        ans = 'No'
        break
      end

      if a[index] == 'a' && can_a_appear == false
        ans = 'No'
        break
      end

      if a[index] == 'a' && can_a_appear
        can_a_appear = true
      end

      if a[index] == 'b'
        can_a_appear = false
        can_b_appear = true
      end
    end

    return can_b_appear == true ? ans : 'No'
  end
end

puts Solution.new.solve("aaabbb")
puts Solution.new.solve("b")
puts Solution.new.solve("aaabbbdd")
puts Solution.new.solve("ssaaabbbdd")
puts Solution.new.solve("axb")
puts Solution.new.solve("aaabbbbbbbb")
puts Solution.new.solve("ab")
puts Solution.new.solve("abab")