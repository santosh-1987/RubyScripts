require 'pry'

class Solution
  # @param a : integer
  # @param b : integer
  # @return an integer
  def LCM(a, b)

    return (a * b) / hcf(a, b)

  end

  def hcf(a, b)
    hcf = 0
    largest = a > b ? a : b
    smallest = a < b ? a : b
    while true do
      if largest % smallest == 0
        hcf = smallest
        break
      else
        remainder = largest % smallest
        largest = smallest
        smallest = remainder
      end
    end
    hcf
  end
end

puts Solution.new.LCM(1, 1)
puts Solution.new.LCM(2, 3)
puts Solution.new.LCM(9, 6)
puts Solution.new.LCM(2, 6)