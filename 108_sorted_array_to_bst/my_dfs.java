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
    public TreeNode sortedArrayToBST(int[] nums) {
        if(nums == null || nums.length == 0) return null;
        return sortedArrayToBST(nums, 0, nums.length - 1);
    }
    
    private TreeNode sortedArrayToBST(int[] nums, int start, int end) {
        if(start > end) return null;
        int middle = start + (end - start)/2;
        TreeNode node = new TreeNode(nums[middle]);
        node.left = sortedArrayToBST(nums, start, middle - 1);
        node.right = sortedArrayToBST(nums, middle + 1, end);
        return node;
    }
}
