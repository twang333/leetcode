// o(n2)
public class Solution {
    public int trap(int[] height) {
        int total = 0;
        for(int i = 0; i < height.length; i++) {
            int leftMax = 0;
            int rightMax = 0;
            int j = i-1;
            while(j >= 0) {
                leftMax = Math.max(leftMax, height[j]);
                j--;
            }
            j = i+1;
            while(j <= height.length - 1) {
                rightMax = Math.max(rightMax, height[j]);
                j++;
            }
            
            int min = Math.min(leftMax, rightMax);
            if(min > height[i]) {
                total += min - height[i];
            }
        }
        return total;
    }
}