/**
 * Definition for a binary tree node.
 * public class TreeNode {
 *     int val;
 *     TreeNode left;
 *     TreeNode right;
 *     TreeNode(int x) { val = x; }
 * }
 */
public class Solution {
    public boolean isValidBST(TreeNode root) {
        return isValidBST(root, Long.MIN_VALUE, Long.MAX_VALUE);
    }
    
    private boolean isValidBST(TreeNode node, long smallest, long largest) {
        if( node == null ) return true;
        if( node.val <= smallest || node.val >= largest) return false;
        return isValidBST(node.left, smallest, node.val) && isValidBST(node.right, node.val, largest);
    }
}