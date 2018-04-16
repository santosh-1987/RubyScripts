a = [3,2,3,2,3,5,6,7].sort!

result = a.reject.with_index do |ele,index|
  res = (a[index+1] ^ ele)
  res == 0
end

print result

# >> [2, 3, 5, 6, 7]
