require_relative 'bird'

class Crow
  include Bird
end

# binding.pry
puts Crow.new.fly(true)
