# @param {Integer[][]} matrix
# @param {Integer} k
# @return {Integer}
require_relative "../lib/min_heap.rb"
def kth_smallest(matrix, k)
  n = matrix[0].size
  minHeap = MinHeap.new do
    (0...n).map do |i|
      Node.new i, 0, matrix[i][0]
    end
  end

  (k-1).times do |i|
    node = minHeap.root
    if node.index_horizontal < n - 1 
      vertical   = node.index_vertical
      horizontal = node.index_horizontal
      new_node = Node.new vertical, horizontal+1, matrix[vertical][horizontal+1]
      minHeap.replace new_node
    else
      minHeap.extract
    end
  end

  return minHeap.root.value
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

matrix = [[ 1,  5,  9], [10, 11, 13], [12, 13, 15] ]
k = 8 
p "Given matrix = #{matrix}, k = #{k}"
p "Expected: 13"
p "Actual: #{kth_smallest(matrix, k)}"
