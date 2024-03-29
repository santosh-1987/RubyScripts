=begin
Groot has N trees lined up in front of him where the height of the i'th tree is denoted by H[i].

He wants to select some trees to replace his broken branches.

But he wants uniformity in his selection of trees.

So he picks only those trees whose heights have frequency K.

He then sums up the heights that occur K times. (He adds the height only once to the sum and not K times).

But the sum he ended up getting was huge so he prints it modulo 10^9+7.

In case no such cluster exists, Groot becomes sad and prints -1.

Constraints:

1.   1<=N<=100000
2.   1<=K<=N
3.   0<=H[i]<=10^9
Input: Integers N and K and array of size A

Output: Sum of all numbers in the array that occur exactly K times.

Example:

Input:

N=5 ,K=2 ,A=[1 2 2 3 3]
Output:

5
Explanation:

There are 3 distinct numbers in the array which are 1,2,3.
Out of these, only 2 and 3 occur twice. Therefore the answer is sum of 2 and 3 which is 5.
=end
# require 'pry'
class Solution
  # @param a : integer
  # @param b : integer
  # @param c : array of integers
  # @return an integer
  def getSum(a, b, c)
    hash = {}
    c.each do |ele|
      count = hash[ele]
      if count.nil?
        hash[ele] = 1
      else
        hash[ele] = count + 1
      end
    end
    sum = hash.select { |key,value| value == b}.map{ |k,v| k}.inject(:+)
    return  sum.nil? ? -1 : sum
  end
end

puts Solution.new.getSum(5, 2, [1, 2, 2, 3, 3])
