public class Solution {
    public int minDepth(TreeNode root) {
        if(null == root) return 0;
        if(null == root.left) return minDepth(root.right) + 1;
        if(null == root.right) return minDepth(root.left) + 1;
        int leftDepth = minDepth(root.left) + 1;
        int rightDepth = minDepth(root.right) + 1;
        return Math.min(leftDepth, rightDepth);
    }
}