public class Solution {
    public int lengthOfLongestSubstring(String s) {
       if(null == s || s.isEmpty()) return 0;
       int res = 1;
       int[] marker = new int[256];
       char[] chars = s.toCharArray();
       Arrays.fill(marker, -1);
       
       int dp = 1;
       marker[chars[0]] = 0;
       for(int i = 1; i < chars.length; i++) {
           dp = chars[i] != chars[i-1] ? Math.min(dp+1, i - marker[chars[i]]) : 1;
           marker[chars[i]] = i;
           res = Math.max(dp, res);
       }
       
       return res;
    }
}