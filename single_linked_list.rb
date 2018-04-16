require "pry"
class LinkedList
  attr_accessor :value
  attr_accessor :head
  def initialize(value,node)
    @value = value
    @head = node
  end

  def next
    return self.head || nil
  end


  def self.traverse(list)
    while(list)
      puts list.value
      list = list.next
    end
  end
end

node2 = LinkedList.new(45,nil)
node1 = LinkedList.new(36,node2)
node3 = LinkedList.new(78,node1)
node4 = LinkedList.new(79,node3)
LinkedList.traverse(node4)
