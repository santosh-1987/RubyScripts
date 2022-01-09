require 'pry'
class Numbers
  def self.factors(num)
    factors = []
    1.upto(num).each do |i|
      factors.<< i if num%i == 0
    end
    return factors
  end

  def self.binary_to_decimal(num)
    binary_numbers = num.to_s.split("").map(&:to_i)
    raise "Invalid Binary Number" if binary_numbers.select {|num| num > 1 || num < 0 }.count >=1
    decimal_value = 0
    binary_numbers.reverse.each_with_index do |value, index|
      decimal_value += value * pow(2,index)
    end
    return decimal_value.to_i
  end

  def self.decimal_to_binary(num)
    return 0 if num <=0
    decimal_numbers = num.to_s.split("").map(&:to_i)
    binary_value = []
    while(num>=1)
      binary_value << num%2.to_i
      num = num/2.to_f
    end
    return binary_value.reverse.map(&:to_i).join("")
  end


  def self.pow(base,exponent)
    result = 1
    range = exponent.positive? ? exponent : exponent * -1
    for i in 1..range
      result *=base
    end
    return exponent.positive? ? result : 1/result.to_f
  end
end

# puts Numbers.pow(2,1)
puts Numbers.decimal_to_binary(0)
