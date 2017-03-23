=begin
The sum of the squares of the first ten natural numbers is,

12 + 22 + ... + 102 = 385
The square of the sum of the first ten natural numbers is,

(1 + 2 + ... + 10)2 = 552 = 3025
Hence the difference between the sum of the squares of the first ten natural numbers and the square of the sum is 3025 − 385 = 2640.

Find the difference between the sum of the squares of the first one hundred natural numbers and the square of the sum.
=end
class Array
  def square!
    self.map! { |num| num ** 2 }
  end
end

class SumSquare
  def self.square_num_upto(number)
    return 0.upto(number).to_a.square!
  end

  def self.square_sum(number)
    0.upto(number).to_a.inject(:+) ** 2
  end
end
puts SumSquare.square_sum(100) - SumSquare.square_num_upto(100).inject(:+)

# >> 25164150
