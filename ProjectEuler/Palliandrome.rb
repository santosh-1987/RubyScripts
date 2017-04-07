=begin
https://projecteuler.net/problem=4
A palindromic number reads the same both ways. The largest palindrome made from the product of two 2-digit numbers is 9009 = 91 × 99.

Find the largest palindrome made from the product of two 3-digit numbers.
=end
require "rubygems"
class Palliandrome
  def self.for_product_of_digit(number)
    hash = {}
    return "Enter a Valid Number" if number <= 0
    highest_no = ("9"*(number)).to_i
    lowest_no = ("1".concat("0"*(number-1))).to_i
    for i in highest_no.downto(lowest_no)
      for j in highest_no.downto(lowest_no)
        product = i*j
        if is_palliandrome?(product)
          hash["#{i}, #{j}"] = product
        end
      end
    end
    return hash
  end

  def self.is_palliandrome?(digit)
    return digit.to_s == digit.to_s.reverse ? true : false
  end
end

print Palliandrome.for_product_of_digit(3)

# >> 580085
