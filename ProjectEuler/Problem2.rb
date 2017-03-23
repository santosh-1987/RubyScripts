=begin
https://projecteuler.net/problem=2
Each new term in the Fibonacci sequence is generated by adding the previous two terms. By starting with 1 and 2, the first 10 terms will be:

1, 2, 3, 5, 8, 13, 21, 34, 55, 89, ...

By considering the terms in the Fibonacci sequence whose values do not exceed four million(40,00,000), find the sum of the even-valued terms.
=end
require "rubygems"
class Fibonacci
  attr_accessor :term, :sequence

  def initialize(term)
    @term = term
    @sequence = [1, 2]
  end

  def fetch_values
    while @sequence[-1] <= @term
      break if (@sequence[-1] + @sequence[-2] > @term)
      @sequence << @sequence[-1] + @sequence[-2]
    end
    return @sequence
  end

  def fetch_sum
    @sequence.inject(0) { |sum, i| (i%2 == 0) ? sum + i : sum }
  end
end

fib = Fibonacci.new(40_00_000)
print fib.fetch_values
puts "Sum :"
print fib.fetch_sum

fibonacci = Hash.new do |hash, key|
  if key <= 1
    hash[key] = key
  else
    hash[key] = hash[key - 1] + hash[key - 2]
  end
end

fibonacci[10]
fibonacci
