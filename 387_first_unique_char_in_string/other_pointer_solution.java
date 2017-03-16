public class Solution {
    public int firstUniqChar(String s) {
        if(null == s || s.length() == 0) return -1;
        if(s.length() == 1) return 0;
        int[] countsMap = new int[26];
        countsMap[s.charAt(0) - 'a'] += 1;
        int slow = 0, fast = 1;
        while(fast < s.length()) {
            countsMap[s.charAt(fast) - 'a'] ++;
            while(slow < s.length() && countsMap[s.charAt(slow) - 'a'] > 1) slow++;
            if(slow >= s.length()) return -1;
            if(countsMap[s.charAt(slow) - 'a'] == 0) {
                countsMap[s.charAt(slow) - 'a'] ++;
                fast = slow;
            }
            fast++;
        }
        return slow;
    }
}