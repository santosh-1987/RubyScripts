=begin
Implement pow(A, B) % C.
In other words, given A, B and C, Find (AB % C).

Note: The remainders on division cannot be negative. In other words, make sure the answer you return is non-negative.
=end
require 'pry'

class Solution
  # @param a : integer
  # @param b : integer
  # @param c : integer
  # @return an integer
  def pow(a, b, c)
    power_with_mod(a, b, c) % c
  end

  def power(a, b)
    return 1 if b == 0
    return a * power(a, b - 1)
  end

  # log n time complexity
  def optimized_power(a, b)
    return 1 if b == 0

    half_power = optimized_power(a, b / 2)
    if (b % 2 == 0)
      return half_power * half_power
    else
      return a * half_power * half_power
    end
  end

  def power_with_mod(num, exp, mod)
    return 1 if exp == 0

    half_power = power_with_mod(num, exp / 2, mod)
    if (exp % 2 == 0)
      return (half_power * half_power) % mod
    else
      return (num % mod * (half_power * half_power) % mod) % mod
    end
  end

end

puts Solution.new.pow(2, 3, 3)
