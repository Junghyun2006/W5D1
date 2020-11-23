require "byebug"

class Node
  attr_reader :key
  attr_accessor :val, :next, :prev

  def initialize(key = nil, val = nil)
    @key = key
    @val = val
    @next = nil
    @prev = nil
  end

  def to_s
    "#{@key}: #{@val}"
  end

  def remove
    # optional but useful, connects previous link to next link
    # and removes self from list.
  end
end

class LinkedList
  def initialize
    @head = Node.new()
    @tail = Node.new()
    @head.next = @tail
    @tail.prev = @head
  end

  def [](i)
    each_with_index { |link, j| return link if i == j }
    nil
  end

  def first
    @head
  end

  def last
    @tail
  end

  def empty?
    return true if @head.next == @tail 
    return false
  end

  def get(key)
    return @head.val if @head.key == key
    current_node = @head

    until current_node == nil
      return current_node.val if current_node.key == key
      current_node = current_node.next
    end

    nil
  end

  def include?(key)
  end

  def append(key, val)
    if @head.key == nil 
      new_head = Node.new(key,val)
      @head = new_head
      @head.next = @tail
      @tail = new_head
    elsif @tail.key == nil
      new_tail = Node.new(key,val)
      @head.next = new_tail
      @tail = new_tail
      @tail.prev = @head
    else
      prev_tail = @tail
      new_tail = Node.new(key,val)
      prev_tail.next = new_tail
      new_tail.prev = prev_tail
      @tail = new_tail
    end
  end

  def update(key, val)
  end

  def remove(key)
  end

  def each
  end

  # uncomment when you have `each` working and `Enumerable` included
  # def to_s
  #   inject([]) { |acc, link| acc << "[#{link.key}, #{link.val}]" }.join(", ")
  # end
end
