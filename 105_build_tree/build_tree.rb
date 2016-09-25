# Definition for a binary tree node.
# class TreeNode
#     attr_accessor :val, :left, :right
#     def initialize(val)
#         @val = val
#         @left, @right = nil, nil
#     end
# end

# @param {Integer[]} preorder
# @param {Integer[]} inorder
# @return {TreeNode}
def build_tree(preorder, inorder)
	if(preorder.size <= 0) {
		return nil
	}

	val = preorder.shift
	index = inorder.index(val)
	left_inorder = inorder.slice(0...index)
	right_inorder = inorder.slice(index+1..-1)
	left_preorder = preorder.slice(0, left_inorder.size)
	right_preorder = preorder.slice(left_preorder.size, right_inorder.size)

	left_tree = build_tree(left_preorder, left_inorder)
	right_tree = build_tree(right_preorder, right_inorder)

	node       = TreeNode.new(val)
	node.left  = left_tree
	node.right = right_tree
	node
end