# Definition for a binary tree node.
# class TreeNode
#     attr_accessor :val, :left, :right
#     def initialize(val)
#         @val = val
#         @left, @right = nil, nil
#     end
# end

# @param {TreeNode} root
# @return {Integer}
def sum_of_left_leaves(root)
	return 0 if root.nil?

	stack = [root]
	left_leaves = []

	while !stack.empty?
		item = stack.pop

		if item.left
			if item.left.right.nil? && item.left.left.nil?
				left_leaves << item.left
			else
				stack.push item.left
			end
		end

		if item.right
			stack.push item.right
		end
	end

	return left_leaves.map { |node| node.val }.reduce(:+)
end