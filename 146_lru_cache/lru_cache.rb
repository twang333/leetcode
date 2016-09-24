class LRUCache
  # Initialize your data structure here
  # @param {Integer} capacity
  def initialize(capacity)
    @list = LinkedHashMap.new(capacity)
  end

  # @param {Integer} key
  # @return {Integer}
  def get(key)
    @list.get(key)
  end

  # @param {Integer} key
  # @param {Integer} value
  # @return {Void}
  def set(key, value)
    @list.set(key, value)
  end
end

class LinkedHashMap
  def initialize(capacity)
    @count     = 0
    @capacity  = capacity
    @map       = {}
    @head      = Node.new
    @tail      = Node.new
    @head.next = @tail
    @tail.prev = @head
  end

  def get(key)
    node = @map[key]
    if node
      refresh(node)
      node.value
    else
      -1
    end
  end

  def set(key, value)
    return if invalid_capacity?
    node = @map[key]
    if node
      node.value = value
      refresh(node)
      return
    end

    node = Node.new(key, value)
    if insufficient_capacity?
      last_node = @tail.prev
      @map.delete(last_node.key)
      remove(last_node)
    end

    shift(node)
    @map[key] = node
  end

  private

  def invalid_capacity?
    @capacity <= 0
  end

  def insufficient_capacity?
    @count >= @capacity
  end

  def refresh(node)
    remove(node)
    shift(node)
  end

  def shift(node)
    @count    += 1
    first      = @head.next
    @head.next = node
    node.prev  = @head
    node.next  = first
    first.prev = node
  end

  def remove(node)
    @count        -= 1
    prev_node      = node.prev
    next_node      = node.next
    prev_node.next = next_node
    next_node.prev = prev_node
    node.prev = node.next = nil
  end

end

class Node
  attr_accessor :key, :value, :prev, :next
  def initialize(key = nil, value = nil)
    @key   = key || 0
    @value = value || 0
  end
end