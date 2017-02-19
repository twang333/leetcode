public class Solution {
    public int longestValidParentheses(String s) {
        if(null == s || s.length() < 2) return 0;
        Deque<Integer> stack = new ArrayDeque<>();
        char[] chars = s.toCharArray();
        int maxLen = 0;
        stack.push(-1);
        for(int i = 0; i < chars.length; i++) {
            if(chars[i] == ')' && stack.size() > 1 && chars[stack.peek()] == '(') {
                stack.pop();
                maxLen = Math.max(maxLen, i - stack.peek());
            } else {
                stack.push(i);
            }
        }
        
        return maxLen;
    }
}