require "pry"
class FizzBuzz
  attr_accessor :numbers
  def initialize(digits)
    @numbers = digits
  end

  def print
    @numbers.each do |num|
      1.upto(num) do |i|
        puts return_status i
      end
    end
  end

  def return_status(num)
   case
    when num%3 == 0 && num%5 == 0
      return "FizzBuzz"
    when num%5 == 0
      return "Buzz"
    when num%3 == 0
      return "Fizz"
    else
      return num
    end
  end
end


puts 'Enter the Number of Test Case'
test = gets.chomp
puts "Enter Numbers"
numbers = gets.chomp
numbers = numbers.split(" ").map(&:to_i)
puts "Invalid Numbers " if numbers.count > 2 || numbers.count < 2 || numbers.include?(nil) ||  numbers.include?(0)

FizzBuzz.new(numbers).print
