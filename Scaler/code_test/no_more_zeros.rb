# Hint : Replace 000 with 1
class Solution
  # @param a : integer
  # @return a string
  def solve(a)
    return a.next unless a%10 == 9

    count = a.next.to_s.count('0')
    num = a + ("1"*count).to_i
    return num.next
  end
end

# puts Solution.new.solve(9)
# puts Solution.new.solve(11)
puts Solution.new.solve(39)
