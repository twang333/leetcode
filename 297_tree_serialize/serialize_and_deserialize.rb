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
	return "nil" if root.nil?
	stack = [[0,root]]
	result = []
	while !stack.empty?
		index, item = stack.pop

		result << "#{index}|#{item.val}"
		if item.right
			stack.push [2*index+2, item.right]
		end
		
		if item.left
			stack.push [2*index+1, item.left]
		end
	end

	return result.join(",")
end

# Decodes your encoded data to tree.
#
# @param {string} data
# @return {TreeNode}
def deserialize(data)
	return nil if data == "nil"
	node_hash = {}
	data.split(',').each do |str|
		index, val = str.split("|")
		node_hash[index.to_i] = TreeNode.new val
	end

	node_hash.each do |k, v|
		if k > 0
			if k.odd?
				node_hash[(k-1)/2].left = v
			else
				node_hash[(k-2)/2].right = v
			end
		end
	end

	return node_hash[0]
end


# Your functions will be called as such:
# deserialize(serialize(data))