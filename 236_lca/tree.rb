# Definition for a binary tree node.
# class TreeNode
#     attr_accessor :val, :left, :right
#     def initialize(val)
#         @val = val
#         @left, @right = nil, nil
#     end
# end

# @param {TreeNode} root
# @param {TreeNode} p
# @param {TreeNode} q
# @return {TreeNode}
def lowest_common_ancestor(root, p, q)
	if root.nil? || root == p || root == q
		return root
	end

	left = lowest_common_ancestor(root.left, p, q)
	right = lowest_common_ancestor(root.right, p, q)

	if left && right
		return root
	end

	if right
		return right
	end

	return left
end