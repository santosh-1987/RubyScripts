require_relative 'bird'

class Penguin
  include Bird
  extend Bird
end

puts Penguin.new.fly(false)
puts Penguin.fly(false)