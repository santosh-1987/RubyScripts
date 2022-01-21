def multiply(base, num)
  return 0 if num == 0
  base + multiply(base, num - 1)
end

puts multiply(5, 7)