# Encodes a tree to a single string.
#
# @param {TreeNode} root
# @return {string}
def serialize(root)
	return "nil" if root.nil?
	stack = [root]
	result = []

	while !stack.empty?
		item = stack.pop
		result << item.val

		if item.right
			stack.push item.right
		end

		if item.left
			stack.push item.left
		end
	end

	return result.join(',')
end

# Decodes your encoded data to tree.
#
# @param {string} data
# @return {TreeNode}
def deserialize(data)
	return nil if data == 'nil'
	array = data.split(",").map {|str| str.to_i }
	return get_node(array)
end

def get_node(array)
	return nil if array.empty?
	root = TreeNode.new(array.first)
	less, more = array[1..-1].partition { |i| i < array.first }
	root.left = get_node(less)
	root.right = get_node(more)
	return root
end
