=begin
Starting in the top left corner of a 2×2 grid, and only being able to move to the right and down, there are exactly 6 routes to the bottom right corner.
IMAGE SRC : https://projecteuler.net/project/images/p015.gif
How many such routes are there through a 20×20 grid?

[[][]]
[[][]]
=end
require "rubygems"
require "pry"
class Lattice
  attr_accessor :lattice
  def initialize(size)
    @lattice = Array.new(size){Array.new(size)}
    @lattice.each { |lattice| lattice.fill(0){|i| i+0} }
  end

  def display
    return @lattice.first.each_index.to_a.product(@lattice.each_index.to_a)
  end
end

lattice = Lattice.new(2)
print lattice.display
