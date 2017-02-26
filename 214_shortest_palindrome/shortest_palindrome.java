public class Solution {
	public String shortestPalindrome(String s) {
		if(null == s || 0 == s.length()) return "";
		String reversedStr = (new StringBuilder(s)).reverse().toString();
		int i;
		for(i = 0; i < reversedStr.length(); i++) {
			if(s.startsWith(reversedStr.substring(i))) {
				break;
			}
		}
		return reversedStr.substring(0, i) + s;
	}
}