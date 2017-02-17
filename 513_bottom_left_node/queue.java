public class Solution {
    public int findBottomLeftValue(TreeNode root) {
        Queue<TreeNode> queue = new LinkedList<>();
        Deque<List<Integer>> stacks = new LinkedList<>();
        queue.offer(root);
        while(!queue.isEmpty()) {
            int l = queue.size();
            List<Integer> list = new ArrayList<>();
            for(int i = 0; i < l; i ++) {
                TreeNode node = queue.poll();
                if(node.left != null) queue.offer(node.left);
                if(node.right != null) queue.offer(node.right);
                list.add(node.val);
            }
            stacks.push(list);
        }
        
        return stacks.pop().get(0);
    }
}