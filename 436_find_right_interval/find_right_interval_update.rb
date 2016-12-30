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
require_relative '../lib/basic_algorithms'
def find_right_interval(intervals)
	nodes = []
	intervals.each_with_index do |interval, index|
		nodes << Node.new(index, interval.start)
	end

	sorted_nodes = quick_sort(nodes)

	result = []

	intervals.each do |interval|
		closest_node = closest_item(sorted_nodes, Node.new(nil, interval.end))

		if closest_node
			result << closest_node.index
		else
			result << -1
		end

	end

	return result

end

def closest_item(array, item)
	return nil if array.last < item

	left = 0
	right = array.size - 1 

	result = nil

	while left <= right
		middle = left + (right - left)/2

		if array[middle] == item
			return array[middle]
		end

		if array[middle] < item
			left = middle + 1
		else
			result = middle
			right = middle - 1
		end
	end

	return array[result]

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

# intervals = [Interval.new(1,4), Interval.new(2,3), Interval.new(3,4) ]
# p "Expected: [-1, 2, -1]"
# p "Outputed: #{find_right_interval(intervals)}"

intervals = [Interval.new(4,5), Interval.new(2,3), Interval.new(1,2) ]
p "Expected: [-1, 0, 1]"
p "Outputed: #{find_right_interval(intervals)}"
