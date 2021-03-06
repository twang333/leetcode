// https://discuss.leetcode.com/topic/65738/java-accepted-simple-solution
public class Solution {
    public List<Integer> findDisappearedNumbers(int[] nums) {
        List<Integer> res = new ArrayList<>();
        for(int i = 0; i < nums.length; i++) {
            int refer = Math.abs(nums[i]) - 1;
            if(nums[refer] > 0) nums[refer] = -nums[refer];
        }
        
        for(int i = 0; i < nums.length; i++) {
            if(nums[i] > 0) res.add(i+1);
        }
        
        return res;
    }
}