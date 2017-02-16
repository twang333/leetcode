public class Solution {
	public List<List<String>> groupAnagrams(String[] strs) {
		HashMap<String, Integer> mapping = new HashMap<>();
		List<List<String>> result = new ArrayList<>();
		for(int i = 0; i < strs.length; i++) {
			int[] charCounter = new int[26];
			String str = strs[i];

			for(int j = 0; j < str.length(); j++) {
				charCounter[str.charAt(j) - 'a'] += 1;
			}

			String code = Arrays.toString(charCounter);
			if(!mapping.containsKey(code)) {
				List<String> tmp = new ArrayList<>();
				result.add(tmp);
				mapping.put(code, result.size()-1);
			}
			result.get(mapping.get(code)).add(str);
		}
		

		return result;
	}
}