require_relative 'node'

class LinkedList
  attr_accessor :head, :tail

  def create(arr)
    for i in 0...arr.length
      if i == 0
        @head = Node.new(arr[i])
        @tail = @head
      else
        node = Node.new(arr[i])
        @tail.next = node
        @tail = node
      end
    end
  end

  def traverse
    temp = @head
    while (temp != nil)
      puts temp.data
      temp = temp.next
    end
  end
end

ll = LinkedList.new
ll.create([3, 4, 5, 6, 7])
ll.traverse





