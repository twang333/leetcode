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
  queue = [[0,root]]
  while !queue.empty?
    height, node = queue.shift
    if result.size == height
      result << node.val
    end
    queue.push [height+1, node.right] if node.right
    queue.push [height+1, node.left] if node.left
  end
  return result
end