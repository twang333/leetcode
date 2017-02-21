public class Solution {
    public String longestCommonPrefix(String[] strs) {
        if(strs == null || strs.length == 0) return "";
        char[] chars = strs[0].toCharArray();
        StringBuilder sb = new StringBuilder();
        for(int i = 0; i< chars.length; i++) {
            char c = chars[i];
            boolean match = true;
            for(int j = 0; j < strs.length; j ++) {
                if(i >= strs[j].length() || strs[j].charAt(i) != c) {
                    match = false;
                    break;
                }
            }
            if(match) {
                sb.append(c);
            } else {
                break;
            }
        }
        return sb.toString();
    }
}