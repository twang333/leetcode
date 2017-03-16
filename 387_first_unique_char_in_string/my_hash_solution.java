// time/space: O(n)/O(1)
public class Solution {
  public int firstUniqChar(String s) {
    if(null == s || s.length() == 0) return -1;
    int[] countsMap = new int[26];
    for(int i = 0; i < s.length(); i++) countsMap[s.charAt(i) - 'a'] += 1;
      for(int i = 0; i < s.length(); i++) {
        if(countsMap[s.charAt(i) - 'a'] == 1) return i;
      }
      return -1;
    }
  }
}