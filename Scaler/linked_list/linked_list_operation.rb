require_relative 'node'

class LinkedList
  attr_accessor :head, :tail

  # Create a linked list from given array
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

  # Traverse a Linked List
  def traverse
    temp = @head
    str = ""
    while (temp != nil)
      str = str + temp.data.to_s
      temp = temp.next
      str += " -> " unless temp == nil
    end
    return str
  end

  # Insert node at a defined position in linked list
  def insert(data, pos)
    validate(pos)

    node = Node.new(data)
    temp = @head
    if pos == 0
      node.next = temp
      @head = node
    else
      index = 0
      while (temp != nil && index < pos - 1)
        temp = temp.next
        index += 1
      end
      raise "Node Position cannot be greater than #{index}" if temp == nil
      node.next = temp.next
      temp.next = node
      @tail = temp.next if temp.next.next == nil
    end
  end

  # Delete a node from linkedlist from given position
  def delete(pos)
    validate(pos)
    temp = @head
    if pos == 0
      @head = @head.next
    else
      index = 0
      while (temp != nil && index < pos - 1)
        temp = temp.next
        index = index + 1
      end
      raise "Node Position cannot be greater than #{index}" if temp == nil || temp.next == nil
      temp.next = temp.next.next
    end
  end

  private

  def validate(pos)
    raise "Invalid Node Position" if pos < 0
  end
end

ll = LinkedList.new
ll.create([3, 4, 5, 6, 7])
puts ll.traverse

ll.insert(1, 1)
puts ll.traverse

ll.delete(5)

puts ll.traverse






