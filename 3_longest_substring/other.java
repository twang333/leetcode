public class Solution {
    public int lengthOfLongestSubstring(String s) {
        if(null == s || s.isEmpty()) return 0;
        int max = 1, length = s.length();
        int left = 0, right = 0;
        char[] chars = s.toCharArray();
        int[] count = new int[256];
        while(right < length) {
            while(count[chars[right]] != 0) {
                max = Math.max(max, right - left);
                count[chars[left++]]--;
            }
            count[chars[right++]]++;
        }
        
        return Math.max(max, right - left);
    }
}