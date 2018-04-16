def recurse_test string, arr = []
  return nil if string.length == 0
  arr << string.slice!(string.length-1)
  recurse_test(string,arr)
  return arr
end

def recurse_time(time,arr=[])
  return arr if time > Time.now+0.5
  recurse_time(time+0.1,arr)
  arr << time
  # return arr
end

puts Time.now
print recurse_time(Time.now)