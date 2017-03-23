=begin
By listing the first six prime numbers: 2, 3, 5, 7, 11, and 13, we can see that the 6th prime is 13.

What is the 10 001st prime number?
=end
require "rubygems"
class PrimeNum
  def self.fetch_list(limit)
    arr = []
    start = 2
     loop do
       arr << start if is_prime?(start)
       start += 1
       break if arr.size == limit
     end
     return arr
  end

  def self.is_prime?(number)
    for i in 2..(number-1)
      return false if number%i == 0
    end
    return true
  end
end

print PrimeNum.fetch_list(10_001).last
# print PrimeNum.is_prime?(1)
