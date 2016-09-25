# Definition for a binary tree node.
# class TreeNode
#     attr_accessor :val, :left, :right
#     def initialize(val)
#         @val = val
#         @left, @right = nil, nil
#     end
# end

class BSTIterator
  # @param {TreeNode} root
  attr_accessor :stack
  def initialize(root)
  	@stack = []
  	push_all(root)
  end

  # @return {Boolean}
  def has_next
  	stack.size > 0
  end

  # @return {Integer}
  def next
  	temp_node = stack.pop
  	push_all(temp_node.right)
  	temp_node.val
  end

  private 
  def push_all(node)
  	while nil != node
  		stack.push(node)
  		node = node.left
  	end
  end
end

# Your BSTIterator will be called like this:
# i, v = BSTIterator.new(root), []
# while i.has_next()
#    v << i.next
# end