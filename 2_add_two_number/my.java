// o(n+m)
public class Solution {
    public ListNode addTwoNumbers(ListNode l1, ListNode l2) {
        int c = 0;
        ListNode i1 = l1, i2 = l2;
        ListNode dummy = new ListNode(-1);
        ListNode t = dummy;
        while( i1 != null || i2 != null) {
            int operand1, operand2;
            if(i1 == null) {
                operand1 = 0;
            } else {
                operand1 = i1.val;
                i1 = i1.next;
            }
            
            if(i2 == null) {
                operand2 = 0;
            } else {
                operand2 = i2.val;
                i2 = i2.next;
            }
            int sum = operand1 + operand2 + c;
            c = sum / 10;
            t.next = new ListNode(sum%10);
            t = t.next;
        }
        if(c!=0) t.next = new ListNode(c);
        return dummy.next;
    }
}