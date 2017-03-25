// twang
// time: O(N^N), N = nums.length
// space: O(N!)

public class Solution {
    public List<List<Integer>> permuteUnique(int[] nums) {
        List<List<Integer>> list = new ArrayList<>();
        Arrays.sort(nums);
        backtrack(list, new ArrayList<>(), nums, new boolean[nums.length]);
        return list;
    }
    
    private void backtrack(List<List<Integer>> list, List<Integer> tempList, int[] nums, boolean[] used) {
        if(nums.length == tempList.size()) {
            list.add(new ArrayList(tempList));
        } else {
            for (int i = 0; i < nums.length; i++) {
                if(used[i] || i>0 && nums[i] == nums[i-1] && !used[i-1]) continue;
                used[i] = true;
                tempList.add(nums[i]);
                backtrack(list, tempList, nums, used);
                used[i] = false;
                tempList.remove(tempList.size() - 1);
            }
        }
    }
    
}