public class Solution {
    int height = 0, value = 0;
    
    public int findBottomLeftValue(TreeNode root) {
        findBottomLeftValue(root, 1);
        return value;
    }
    
    private void findBottomLeftValue(TreeNode node, int level) {
        if(level > height) {
            height = level;
            value = node.val;
        }
        if(null != node.left) findBottomLeftValue(node.left, level+1);
        if(null != node.right) findBottomLeftValue(node.right, level+1);
    }
}