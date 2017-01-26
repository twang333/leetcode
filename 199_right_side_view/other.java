package leetcode;

import java.util.ArrayList;
import java.util.LinkedList;
import java.util.List;

public class Solution299 {

  public List<Integer> rightSideView(TreeNode root) {
    List<Integer> result = new ArrayList<>();
    rightMostAtHeight(root, result, 0)
    return result
  }

  public void rightMostAtHeight(TreeNode node, List<Integer> result, int height) {
    if(null == node) return;
    if (height == result.size) {
      result.add(node.val);
    }
    rightSideView(node.right, result, height+1);
    rightSideView(node.left, result, height+1);
  }

}