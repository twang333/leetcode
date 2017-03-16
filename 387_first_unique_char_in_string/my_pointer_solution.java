public class Solution {
  public int firstUniqChar(String s) {
    if(null == s || s.length() == 0) return -1;
    if(s.length() == 1) return 0;
    int[] countsMap = new int[26];
    countsMap[s.charAt(0) - 'a'] += 1;
    int slow = 0, fast = 1;
    while(fast < s.length() && slow < s.length()) {
      countsMap[s.charAt(fast) - 'a'] += 1;
      
      if(s.charAt(slow) == s.charAt(fast)) {
        while(slow < s.length() && countsMap[s.charAt(slow) - 'a'] > 1) slow++;
      }
      
      fast++;
    }
    return slow >= s.length() ? -1 : slow;
  }
}