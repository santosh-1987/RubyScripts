num = 4
2.upto(num-1).each do |i|
  puts "#{num} % #{i} = #{num%i == 0}" if num%i == 0
end

# >> 6 % 2 = true
# >> 6 % 3 = true
