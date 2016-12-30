# Definition for an interval.
class Interval
	attr_accessor :start, :end
	def initialize(s=0, e=0)
		@start = s
		@end = e
	end
end

# @param {Interval[]} intervals
# @return {Integer[]}
require_relative '../lib/max_heap'
def find_right_interval(intervals)

	max_heap = MaxHeap.new do
		nodes = []
		intervals.each_with_index do |interval, index|
			nodes << Node.new(index, interval.start)
		end
		nodes
	end

	result = []

	intervals.each do |interval|
		node = Node.new(nil, interval.end)
		closest_node = max_heap.search_closest(node)
		if closest_node
			result << closest_node.index
		else
			result << -1
		end
	end

	return result

end

class Node
	include Comparable
	attr_accessor :index, :value

	def initialize(index, value)
		@index = index
		@value = value
	end

	def <=>(other)
		value <=> other.value
	end
end


# intervals = [Interval.new(1,2)]
# p "Expected: [-1]"
# p "Outputed: #{find_right_interval(intervals)}"

# intervals = [Interval.new(3,4), Interval.new(2,3), Interval.new(1,2) ]
# p "Expected: [-1, 0, 1]"
# p "Outputed: #{find_right_interval(intervals)}"

intervals = [Interval.new(1,4), Interval.new(2,3), Interval.new(3,4) ]
p "Expected: [-1, 2, 1]"
p "Outputed: #{find_right_interval(intervals)}"
