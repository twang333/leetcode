# Definition for a binary tree node.
# class TreeNode
#     attr_accessor :val, :left, :right
#     def initialize(val)
#         @val = val
#         @left, @right = nil, nil
#     end
# end

# Encodes a tree to a single string.
#
# @param {TreeNode} root
# @return {string}
def serialize(root)
	return build_string(root)
end

def build_string(node)
	return 'nil' if node.nil?
	str = "#{node.val},"
	str += build_string(node.left)
	str += ","
	str += build_string(node.right)
	return str
end

# Decodes your encoded data to tree.
#
# @param {string} data
# @return {TreeNode}
def deserialize(data)
	return nil if data == "nil"
	array = data.split(',')
	return build_tree(array)
end

def build_tree(array)
	# too expensive
	str = array.unshift
	reuturn nil if str == "nil"

	node = TreeNode.new str
	node.left = build_tree(array)
	node.right = build_tree(array)
	return node
end


# Your functions will be called as such:
# deserialize(serialize(data))