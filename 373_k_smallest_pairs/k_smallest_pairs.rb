# @param {Integer[]} nums1
# @param {Integer[]} nums2
# @param {Integer} k
# @return {Integer[][]}
require_relative "../lib/min_heap"
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

