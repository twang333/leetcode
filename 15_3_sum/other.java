// o(n)
public class Solution {
    public List<List<Integer>> threeSum(int[] nums) {
        Arrays.sort(nums);
        List<List<Integer>> res = new ArrayList<>();
        for(int i = 0; i < nums.length; i++) {
            if(i == 0 || nums[i] != nums[i-1]) {
                int lo = i + 1, hi = nums.length - 1, sum = 0 - nums[i];
                while(lo < hi) {
                    if(sum == nums[lo] + nums[hi]) {
                        res.add(Arrays.asList(nums[i], nums[lo], nums[hi]));
                        while(lo < hi && nums[lo] == nums[lo+1]) lo++;
                        while(lo < hi && nums[hi] == nums[hi-1]) hi--;
                        lo++; hi--;
                    } else if( sum < nums[lo] + nums[hi] ) {
                        hi--;
                    } else lo++;
                }
            }
        }
        
        return res;
    }
}