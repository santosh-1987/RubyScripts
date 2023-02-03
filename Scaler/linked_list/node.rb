=begin
Linked List Node class
=end

class Node
  attr_accessor :data, :next, :previous

  def initialize(data)
    self.data = data
    self.next = nil
    self.previous = nil
  end
end