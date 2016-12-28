# @param {Integer[][]} matrix
# @param {Integer} k
# @return {Integer}
def kth_smallest(matrix, k)
  n = matrix[0].size
  minHeap = new MinHeap do
    (0...n).map do |i|
      new Node i, 0, matrix[i][0]
    end
  end

end


class Node
  include Comparable
  attr_accessor :index_vertical,  :index_horizontal, :value

  def initialize(vertical, horizontal, value)
    @index_vertical   = vertical
    @index_horizontal = horizontal
    @value            = value
  end

  def <=>(other)
    value <=> other.value
  end

end

class MinHeap
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
    array[1..-1].each_with_index do |item, index|
      heapify_up(index)
    end
  end

  def heapify_up(index = nil)
    index ||= array.size - 1

    parent_index = (index - 1)/2
    smallest = index

    if parent_index > 0 && array[parent_index] > array[smallest]
      smallest = parent_index
    end

    if smallest != index
      swap(index, smallest)
      heapify_up(smallest)
    end
  end

  def heapify_down(index = nil)
    index ||= 0
    size = array.size

    left_child = 2 * index + 1
    right_child = 2 * index + 2
    smallest = index

    if left_child < size && array[smallest] > array[left_child]
      smallest = left_child
    end

    if right_child < size && array[smallest] > array[right_child]
      smallest = right_child
    end

    if index != smallest
      swap(index, smallest)
      heapify_down(smallest)
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

  private
  def swap(i, j)
    temp = array[j]
    array[j] = array[i]
    array[i] = temp
  end

end