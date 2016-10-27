# Definition for singly-linked list.
# class ListNode
#     attr_accessor :val, :next
#     def initialize(val)
#         @val = val
#         @next = nil
#     end
# end

# @param {ListNode} head
# @param {Integer} m
# @param {Integer} n
# @return {ListNode}
def reverse_between(head, m, n)
  return nil if head.nil?

  dummy = ListNode.new(nil)
  dummy.next = head
  pre = dummy

  i = 1
  while i < m 
    pre = pre.next
    i += 1
  end

  start = pre.next
  after = start.next

  while i < n
    start.next = after.next
    after.next = pre.next
    pre.next = after

    after = start.next
    i += 1
  end

  dummy.next

end