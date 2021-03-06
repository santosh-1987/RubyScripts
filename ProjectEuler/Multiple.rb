=begin
https://projecteuler.net/problem=1
If we list all the natural numbers below 10 that are multiples of 3 or 5, we get 3, 5, 6 and 9. The sum of these multiples is 23.

Find the sum of all the multiples of 3 or 5 below 1000.
=end

require "rubygems"

class Multiple
  attr_accessor :numbers, :limit

  def initialize(multiples = [], limit=1000)
    @numbers = multiples if multiples.is_a?(Array)
    @limit = limit
  end

  def fetch_valids
    return nil if @numbers.empty?
    valids = []
    @limit.downto(0).each do |num|
      status = @numbers.map { |cond| num%cond == 0 }
      valids << num if status.include?(true)
    end
    return valids
  end
end

multiple = Multiple.new([3, 5], 100)
print multiple.fetch_valids.inject(&:+)

# >> 2418
