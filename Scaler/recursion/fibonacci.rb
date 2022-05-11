class Solution
  # @param a : integer
  # @return an integer
  def findAthFibonacci(a)
    return 0 if a == 0
    return 1 if a == 1 || a == 2
    return findAthFibonacci(a - 1) + findAthFibonacci(a - 2)
  end
end
