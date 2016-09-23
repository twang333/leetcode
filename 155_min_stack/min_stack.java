public class MinStack {

    /** initialize your data structure here. */
    private Stack<Integer> stack;
    private int min;
    public MinStack() {
        stack = new Stack();
        min = 0;
    }
    
    public void push(int x) {
        if(stack.isEmpty()) {
            stack.push(x);
            min = x;
        } else if (x <= min) {
            stack.push(min);
            stack.push(x);
            min = x;
        } else {
            stack.push(x);
        }
    }
    
    public void pop() {
        if (stack.isEmpty()) return; 
        if (stack.peek() == min) {
            stack.pop();
            if(!stack.isEmpty()) {
                min = stack.pop();
            }
        } else {
            stack.pop();
        }
    }
    
    public int top() {
       return stack.peek();
    }
    
    public int getMin() {
        return min;
    }
}

/**
 * Your MinStack object will be instantiated and called as such:
 * MinStack obj = new MinStack();
 * obj.push(x);
 * obj.pop();
 * int param_3 = obj.top();
 * int param_4 = obj.getMin();
 */