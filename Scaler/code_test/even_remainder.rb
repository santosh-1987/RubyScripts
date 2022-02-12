require 'pry'

def main()
  a = gets.to_i
  arr_length = gets.to_i
  b = gets.strip.split(" ").map(&:to_i)
  count = 0
  b.each do |num|
    result = num % a
    count += 1 if result % 2 == 0
  end
  puts count
end

main