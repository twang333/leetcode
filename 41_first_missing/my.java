// inspired by https://discuss.leetcode.com/topic/65738/java-accepted-simple-solution
public class Solution {
    public int firstMissingPositive(int[] nums) {
        for(int i = 0; i < nums.length; i++) {
            if(nums[i] <= 0) nums[i] = nums.length+1;
        }
        
        for(int i = 0; i < nums.length; i++) {
            int refer = Math.abs(nums[i]) - 1;
            if(refer < nums.length && nums[refer] > 0) nums[refer] = -nums[refer];
        }
        
        for(int i = 0; i < nums.length; i++) {
            if(nums[i] > 0) return i+1;
        }
        return nums.length+1;
    }
}