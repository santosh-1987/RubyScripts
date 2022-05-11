class Solution
  # @param a : integer
  # @return an integer
  def fact(a)
    return 1 if a == 0
    return a * fact(a - 1)
  end
end
