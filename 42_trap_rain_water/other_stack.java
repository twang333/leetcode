// stack o(n)
public class Solution {
    public int trap(int[] height) {
        int result = 0;
        int i = 0, n = height.length;
        Deque<Integer> stack = new LinkedList<>();
        while(i < n) {
            if(stack.isEmpty() || height[i] <= height[stack.peek()] ) {
                stack.push(i++);
            } else {
                int j = stack.pop();
                if(!stack.isEmpty()) {
                    result += (Math.min(height[i], height[stack.peek()]) - height[j]) * (i - stack.peek() - 1);
                }
            }
        }
        return result;
    }
}