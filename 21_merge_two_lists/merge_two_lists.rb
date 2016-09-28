# Definition for singly-linked list.
# class ListNode
#     attr_accessor :val, :next
#     def initialize(val)
#         @val = val
#         @next = nil
#     end
# end

# @param {ListNode} l1
# @param {ListNode} l2
# @return {ListNode}
def merge_two_lists(l1, l2)
  return l2 if l1.nil?
  return l1 if l2.nil?

  l1_sign = list_sign(l1)
  l2_sign = list_sign(l2)

  if l1_sign == 1 || l2_sign == 1
    sign = 1
  else
    sign = -1
  end

  return do_merge(l1, l2, sign)

end

def do_merge(l1, l2, sign)
  return l2 if l1.nil?
  return l1 if l2.nil?

  if sign*l1.val < sign*l2.val
    l1.next = do_merge(l1.next, l2, sign)
    return l1
  else
    l2.next = do_merge(l1, l2.next, sign)
    return l2
  end
end

# 1: increase
# -1: other
def list_sign(list)
  iterator = list
  while !iterator.next.nil?
    iterator = iterator.next
  end

  iterator.val > list.val ? 1 : -1
end
