require "rubygems"

a = 5


t1 =  Thread.new {
  sleep 20
  puts "I am Thread 1 - 20 "
  Thread.list.select {|thread| puts thread.status}
  Thread.list.select {|thread| thread.status == "run"}.count
}

t2 = Thread.new {
  sleep 10

  puts "I am thread 2 - 10"
  Thread.list.select {|thread| puts thread.status}
  Thread.list.select {|thread| thread.status == "run"}.count
}

t3 = Thread.new {
  sleep 15
  puts "I am Thread 3- 15"
  Thread.list.select {|thread| puts thread.status}
  Thread.list.select {|thread| thread.status == "run"}.count
}

puts Thread.list.select {|thread| thread.status == "run"}.count

Thread.list.select {|thread| puts thread.status}

t1.join()
t2.join()
t3.join()

puts "&&&&&&&&&"
Thread.list.select {|thread| puts thread.status}
puts Thread.list.select {|thread| thread.status == "run"}.count