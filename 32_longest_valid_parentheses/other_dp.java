// https://discuss.leetcode.com/topic/2426/my-dp-o-n-solution-without-using-stack
public class Solution {
    public int longestValidParentheses(String s) {
        if(null == s || s.length() < 2) return 0;
        int[] dp = new int[s.length()];
        char[] chars = s.toCharArray();
        int maxLen = 0;
        for(int i = 1; i < chars.length; i++) {
            if(chars[i] == ')') {
                if(chars[i-1] == '(') {
                    if(i >= 2) {
                        dp[i] = dp[i-2] + 2; 
                    } else {
                        dp[i] = 2;
                    }
                } else {
                    int p = i - dp[i-1] - 1;
                    if( p >= 0 && chars[p] == '(') {
                        if(i >= dp[i-1] + 2) {
                            dp[i] = dp[i-1] + 2 + dp[i - dp[i-1] - 2];
                        } else {
                            dp[i] = dp[i-1] + 2;
                        }
                    }
                }
            }
            maxLen = Math.max(maxLen, dp[i]);
        }
        return maxLen;
    }
}