require_relative 'bird'

class Ostrich
  extend Bird
end

puts Ostrich.fly(false)