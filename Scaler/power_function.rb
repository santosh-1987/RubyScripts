require 'pry'
class Solution
  # @param a : integer
  # @param b : integer
  # @param c : integer
  # @return an integer
  def pow(a, b, c)
    count = 1
    1.upto(b) do |_|
      count *= a
    end
    return count%c
  end
end

# puts Solution.new.pow(2,3,3)
# puts Solution.new.pow(71045970,41535484,64735492)
puts Solution.new.pow(0,0,1)
