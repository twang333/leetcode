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
def rob(root)
  not_rob_root, rob_root = rob_sub(root)
  return [not_rob_root, rob_root].max
end

def rob_sub(node)
  return Array.new(2, 0) if node.nil?

  not_rob_left, rob_left = rob_sub(node.left)
  not_rob_right, rob_right = rob_sub(node.right)

  not_rob_node = [not_rob_left, rob_left].max + [not_rob_right, rob_right].max 
  rob_node = node.val + not_rob_left + not_rob_right

  return [not_rob_node, rob_node]
end