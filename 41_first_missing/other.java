//https://discuss.leetcode.com/topic/10351/o-1-space-java-solution
public class Solution {
    public int firstMissingPositive(int[] nums) {
        int i = 0;
        while( i < nums.length) {
            if(nums[i] > nums.length || nums[i] <= 0 || nums[i] == i+1) i++;
            else if(nums[i] != nums[nums[i] - 1]) {
                swap(nums, i, nums[i] - 1);
            } else i++;
        }
        
        i = 0;
        while(i < nums.length && nums[i] == i+1) i++;
        return i+1;
    }
    
    private void swap(int[] n, int i, int j) {
        int tmp = n[i];
        n[i] = n[j];
        n[j] = tmp;
    }
}