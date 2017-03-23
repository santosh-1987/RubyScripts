=begin
https://projecteuler.net/problem=5
2520 is the smallest number that can be divided by each of the numbers from 1 to 10 without any remainder.

What is the smallest positive number that is evenly divisible by all of the numbers from 1 to 20?
#http://www.mathblog.dk/project-euler-problem-5/
=end
require "rubygems"

class EvenlyDivisible
  def self.fetch_divisible_upto(number)
    return "Enter a Valid number" if number.to_i < 2
    count = number
    loop do
      ary = []
      for i in 1..number
        ary << (count%i == 0)
        status = ary.include?(false)
      end
      return count unless ary.include?(false)
      count += number
    end
  end
end
print EvenlyDivisible.fetch_divisible_upto(20)

# >> 2520
