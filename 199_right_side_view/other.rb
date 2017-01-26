# Definition for a binary tree node.
# class TreeNode
#     attr_accessor :val, :left, :right
#     def initialize(val)
#         @val = val
#         @left, @right = nil, nil
#     end
# end

# @param {TreeNode} root
# @return {Integer[]}
def right_side_view(root)
  return [] if root.nil?
  result = []
  stack = [[0,root]]
  while !stack.empty?
    height, node = stack.pop
    if result.size == height
      result << node.val
    end
    stack.push [height+1, node.left] if node.left
    stack.push [height+1, node.right] if node.right
  end
  return result
end