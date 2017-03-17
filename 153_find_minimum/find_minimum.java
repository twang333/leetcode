public class Solution {
    public int findMin(int[] nums) {
        int l = 0, r = nums.length - 1;
        while(l < r) {
            if(nums[l] < nums[r]) return nums[l];
            
            int m = l + (r - l)/2;
            if(nums[m] < nums[r]) {
                r = m;
            } else {
                l = m + 1;
            }
        }
        
        return nums[l];
    }
}