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
def count_nodes(root)
  return 0 if root.nil?

  left_height = calculate_left_most_height root.left
  right_height = calculate_right_most_height root.right

  if left_height == right_height
    (2 << left_height) - 1
  elsif left_height > right_height
    1 + count_nodes(root.left) + count_nodes(root.right)
  else
    raise "invalid complete tree"
  end

end

def calculate_left_most_height node
  return 0 if node.nil?
  height = 0
  while node
    height += 1
    node = node.left
  end

  return height
end

def calculate_right_most_height node
  return 0 if node.nil?
  height = 0
  while node
    height += 1
    node = node.right
  end

  return height
end