class Solution
  # @param a : integer
  # @param b : integer
  # @param c : array of integers
  # @return an integer
  def maxSubarray(a, b, c)
    arr = []
    for i in 0..(c.length) do
      arr = arr + c.combination(i).to_a
    end
    arr = arr.map { |ele| ele.inject(:+) || 0 }
    print arr
  end
end


# puts Solution.new.maxSubarray(5,12,[2, 1, 3, 4, 5])
# puts Solution.new.maxSubarray(9,14,[ 1, 2, 4, 4, 5, 5, 5, 7, 5 ])
puts Solution.new.maxSubarray(1,75,[ 4 ])