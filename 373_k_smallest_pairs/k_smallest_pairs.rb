# @param {Integer[]} nums1
# @param {Integer[]} nums2
# @param {Integer} k
# @return {Integer[][]}
def k_smallest_pairs(nums1, nums2, k)
  return [] if nums1.size == 0 || nums2.size == 0 || k == 0
  minHeap = MinHeap.new do
    nums2.map do |item|
      Node.new nums1[0], item
    end
  end

  result = []
  [k, nums2.size * nums1.size].min.times do |i|
    root = minHeap.root
    if root.index < nums1.size - 1
      new_node = Node.new nums1[root.index + 1], root.value_2, root.index + 1
      minHeap.replace new_node
    else
      minHeap.extract
    end
    result << [root.value_1, root.value_2]
  end

  return result
end

class Node
  include Comparable
  attr_accessor :value_1,  :value_2, :index

  def initialize(value_1, value_2, index = 0)
    @value_1 = value_1
    @value_2 = value_2
    @index   = index
  end

  def <=>(other)
    (value_1 + value_2) <=> (other.value_1 + other.value_2)
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

nums1 = [1,7,11]
nums2 = [2,4,6]
k = 3
p "Given nums1 = [1,7,11], nums2 = [2,4,6], k = 3"
p "Expected: [1,2],[1,4],[1,6]"
p "Actual: #{k_smallest_pairs(nums1, nums2, k)}"

nums1 = [1,1,2]
nums2 = [1,2,3]
k = 2
p "Given nums1 = [1,1,2], nums2 = [1,2,3],  k = 2"
p "Expected: [1,1],[1,1]"
p "Actual: #{k_smallest_pairs(nums1, nums2, k)}"

nums1 = [1,2]
nums2 = [3]
k = 3 
p "Given nums1 = [1,2], nums2 = [3],  k = 3"
p "Expected: [1,3],[2,3]"
p "Actual: #{k_smallest_pairs(nums1, nums2, k)}"

nums1 = [1,1,2]
nums2 = [1,2,3]
k = 10
p "Given nums1 = [1,1,2], nums2 = [1,2,3],  k = 10"
p "Expected: [1,1],[1,1],[2,1],[1,2],[1,2],[2,2],[1,3],[1,3],[2,3]"
p "Actual: #{k_smallest_pairs(nums1, nums2, k)}"

nums1 = [1,7,11]
nums2 = [2,4,6]
k = 3
p "Given nums1 = #{nums1}, nums2 = #{nums2},  k = #{k}"
p "Expected: [[1,2],[1,4],[1,6]]"
p "Actual: #{k_smallest_pairs(nums1, nums2, k)}"

