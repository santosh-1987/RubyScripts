=begin
Given an integer A. Unset B bits from the right of A in binary.
For eg:-
A = 93, B = 4
A in binary = 1011101
A should become = 1010000 = 80. Therefore return 80.
=end

class Solution
  # @param a : long
  # @param b : integer
  # @return a long
  def solve(a, b)
    for i in 0...b
      if check_bit(a, i)
        a = toggle_bit(a, i)
      end
    end
    return a
  end

  def check_bit(num, bit_no)
    return (num >> bit_no) & 1 == 1 ? true : false
  end

  def set_bit(num, bit_no)
    return num | (1 << bit_no)
  end

  def toggle_bit(num, bit_no)
    return num ^ (1 << bit_no)
  end
end

puts Solution.new.solve(25, 3)
