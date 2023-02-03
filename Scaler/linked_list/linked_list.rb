require_relative 'node'
require 'pry'

class LinkedList

  attr_accessor :head, :tail

  # Initializes a Linked List
  def initialize(*args)
    unless args.length == 0
      args.flatten.each do |element|
        node = create_node(element)
        if @head.nil?
          @head = node
          @tail = node
        else
          thead = @head
          while thead.next != nil
            thead = thead.next
          end
          thead.next = node
          @tail = node
        end
      end
    end
  end

  # Adds a Node to the End of linked list
  def add(elem)
    node = create_node(elem)
    if @head.nil?
      @head = node
      @tail = node
    else
      thead = @head
      while thead.next != nil
        thead = thead.next
      end
      thead.next = node
      @tail = node
    end
  end

  # Reverses a Linked List
  def reverse
    return if @head.nil? || @head == @tail
    data = traverse.reverse
    @head = nil
    @tail = nil
    initialize(data)
  end

  # Traverses the Node
  def traverse
    data = []
    if @head.nil?
      puts "[]"
      return data
    else
      thead = @head
      while !thead.next.nil?
        data << thead.data
        thead = thead.next
      end
      data << thead.data
      return data
    end
  end

  # Returns the Tail Node if Present
  def pop
    if @head.nil?
      return nil
    elsif @head == @tail
      data = @head.data
      @head = nil
      @tail = nil
      return data
    else
      thead = @head
      while !thead.next.next.nil?
        thead = thead.next
      end
      @tail = thead
      thead.next = nil
    end
  end

  # Inserts a Node at Given position, if POS is greater than length inserts at End
  def insert_at(pos, node) end

  # Deletes at Node from Specific Position
  def delete_at(pos) end

  private

  def create_node(elem)
    Node.new(elem)
  end
end

linked_list = LinkedList.new()
linked_list.add(2)
linked_list.add(3)
linked_list.pop
puts linked_list.traverse.inspect
linked_list.reverse
puts linked_list.traverse.inspect
