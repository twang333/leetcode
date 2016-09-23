public class LRUCache {
  private class Node {
    int key, value;
    Node prev, next;
    
    public Node() {
      key = 0;
      value = 0;
    }
    
    public Node(int k, int v) {
      key = 0;
      value = v;
    }
  }
  
  private int capacity, count;
  private Map<Integer, Node> map;
  private Node head, tail;
  
  public LRUCache(int capacity) {
    this.count = 0;
    this.capacity = capacity;
    this.map = new HashMap<>(); 
    head = new Node();
    tail = new Node();
    head.next = tail;
    tail.prev = head;
  }
  
  public int get(int key) {
    Node node = map.get(key);
    if(null == node) {
      return -1;
    }
    remove(node);
    addAtHead(node);
    return node.value;
  }
  
  public void set(int key, int value) {
    if(count >= capacity) {
      Node node = tail.prev;
      node.prev.next = node.next;
      node.next.prev = node.prev;
      node.prev = null;
      node.next = null;
      map.remove(node.key);
    } else {
      count ++;
    }
    Node node = new Node(key, value);
    addAtHead(node);
    map.put(key, node);
  }
  
  
  private void remove(Node node) {
    node.prev.next = node.next;
    node.next.prev = node.prev;
    node.prev = null;
    node.next = null;
  }
  
  private void addAtHead(Node node) {
    Node after = head.next;
    node.next = after;
    node.prev = head;
    head.next = node;
    after.prev = node;
  }
}
