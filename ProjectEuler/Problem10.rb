=begin
The sum of the primes below 10 is 2 + 3 + 5 + 7 = 17.

Find the sum of all the primes below two million.
=end
require "rubygems"
class PrimeNum
  def self.fetch_list(number_limit)
    arr = []
    start = 2
     loop do
       if is_prime?(start)
         arr << start
         puts start
       end
       break if start > number_limit
       start += 1
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

arr = PrimeNum.fetch_list(2_000_000)
print arr.inject(:+)
# >> 5736396
