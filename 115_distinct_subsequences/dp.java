public class Solution {
    public int numDistinct(String s, String t) {
        int slength = s.length(), tlength = t.length();
        int[][] dp = new int[slength+1][tlength+1];
        for(int i = 0; i < slength+1; i++) dp[i][0] = 1;
        for(int i = 1; i < slength+1; i++) {
            for(int j = 1; j < tlength+1; j++) {
                dp[i][j] = dp[i-1][j];
                if(t.charAt(j-1) == s.charAt(i-1)) {
                    dp[i][j] += dp[i-1][j-1];
                }
            }
        }
        
        return dp[slength][tlength];
    }
}