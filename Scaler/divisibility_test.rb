def main()
  num = gets.to_i
  divisors = [5,11]
  quotient = true
  divisors.each do |divisor|
    quotient =  num%divisor == 0
    break if quotient == false
  end
  return quotient == false ? 0 : 1;
end

puts main()