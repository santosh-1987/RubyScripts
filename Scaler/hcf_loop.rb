def main()
  ip = gets.to_i
  1.upto(ip).each do |_|
    inputs = gets.strip
    inputs.split("\n").each do |number|
      a, b = number.split(" ").map(&:to_i)
      puts hcf(a, b)
    end
  end
end

def hcf(a, b)
  hcf = 0
  largest = a > b ? a : b
  smallest = a < b ? a : b
  while true do
    if largest % smallest == 0
      hcf = smallest
      break
    else
      remainder = largest % smallest
      largest = smallest
      smallest = remainder
    end
  end
  hcf
end

puts hcf(3328, 9373)