public class Solution {
  public int trap(int[] height) {
    if (null == height && height.length < 2) return 0;

    int left    = 0, right = height.length - 1;
    int leftMax = 0, rightMax = 0;
    int result  = 0;

    while(left <= right) {
      leftMax  = Math.max(leftMax, height[left]);
      rightMax = Math.max(rightMax, height[right]);

      if(leftMax < rightMax) {
        result += leftMax - height[left];
        left++;
      } else {
        result += rightMax - height[right];
        right--;
      }
    }

    return result;
  }
}