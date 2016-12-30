class MaxHeap
  attr_accessor :array
  def initialize(array = [])
    @array = array
    if block_given?
      @array = yield
    end
    heapify
  end

  def heapify
    return if array.size < 2
    array[1..-1].each_with_index do |item, i|
      heapify_up(i + 1)
    end
  end

  def heapify_up(index = nil)
    index ||= array.size - 1

    parent_index = (index - 1)/2
    largest = index

    if parent_index >= 0 && array[parent_index] < array[largest]
      largest = parent_index
    end

    if largest != index
      swap(index, largest)
      heapify_up(largest)
    end
  end

  def heapify_down(index = nil)
    index ||= 0
    size = array.size

    left_child = 2 * index + 1
    right_child = 2 * index + 2
    largest = index

    if left_child < size && array[largest] < array[left_child]
      largest = left_child
    end

    if right_child < size && array[largest] < array[right_child]
      largest = right_child
    end

    if index != largest
      swap(index, largest)
      heapify_down(largest)
    end

  end

  def insert(item)
    array << item
    heapify_up
  end

  def extract
    return nil if array.size < 1
    first = array.first
    array[0] = array.last
    array.pop
    heapify_down
    return first
  end

  def replace(item)
    return nil if array.size < 1
    first = array.first
    array[0] = item
    heapify_down
    return first
  end

  def root
    array.first
  end

  def search_closest(node, index = 0)
    if index < array.size && array[index] >= node 
      left_child_index  = 2*index + 1
      right_child_index = 2*index + 2 

      left = search_closest(node, left_child_index)
      right = search_closest(node, right_child_index)

      return [left, right, array[index]].compact.min

    else
      return nil 
    end
  end

  private
  def swap(i, j)
    temp = array[j]
    array[j] = array[i]
    array[i] = temp
  end

end
