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
  return 0 if root.nil?
  dp_hash = {}

  max_rob_at_node(root, dp_hash)
end

def max_rob_at_node(node, dp_hash)
  return 0 if node.nil?
  if dp_hash[node]
    return dp_hash[node]
  else
    candidate1 = max_rob_at_node(node.left, dp_hash) + max_rob_at_node(node.right, dp_hash)
    candidate2 = node.val
    [node.left, node.right].each do |n|
      if n
        candidate2 += max_rob_at_node(n.left, dp_hash)
        candidate2 += max_rob_at_node(n.right, dp_hash)
      end
    end
    max = [candidate2, candidate1].max
    dp_hash[node] = max
    return max
  end
end