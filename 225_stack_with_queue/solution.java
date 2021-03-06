public class MyStack {

    /** Initialize your data structure here. */
    private Queue<Integer> queue;
    private Queue<Integer> cache;
    public MyStack() {
        this.queue = new LinkedList<>();
        this.cache = new LinkedList<>();
    }
    
    /** Push element x onto stack. */
    public void push(int x) {
        while(!queue.isEmpty()) {
            int item = queue.poll();
            cache.offer(item);
        }
        queue.offer(x);
        while(!cache.isEmpty()){
            int item = cache.poll();
            queue.offer(item);
        }
    }
    
    /** Removes the element on top of the stack and returns that element. */
    public int pop() {
        return queue.poll();
    }
    
    /** Get the top element. */
    public int top() {
        return queue.peek();
    }
    
    /** Returns whether the stack is empty. */
    public boolean empty() {
        return queue.isEmpty();
    }
}
