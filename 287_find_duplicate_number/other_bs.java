// https://discuss.leetcode.com/topic/25580/two-solutions-with-explanation-o-nlog-n-and-o-n-time-o-1-space-without-changing-the-input-array
public class Solution {
    public int findDuplicate(int[] nums) {
        int low = 0, high = nums.length - 1;
        while( low < high) {
            int middle = low + (high - low) / 2;
            int count = 0;
            for(int val : nums){
                if(val <= middle) count++;   
            }
            
            if(count > middle) {
                high = middle;
            } else {
                low = middle + 1;
            }
        }
        
        return low;
    }
}