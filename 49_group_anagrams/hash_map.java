public class Solution {
    public List<List<String>> groupAnagrams(String[] strs) {
        HashMap<String, List<String>> mapping = new HashMap<>();
        for(int i = 0; i < strs.length; i++) {
            int[] charCounter = new int[26];
            String str = strs[i];
            
            for(int j = 0; j < str.length(); j++) {
                charCounter[str.charAt(j) - 'a'] += 1;
            }
            
            String code = Arrays.toString(charCounter);
            if(!mapping.containsKey(code)) {
                mapping.put(code, new ArrayList<String>());
            }
            mapping.get(code).add(str);
        }
        List<List<String>> result = new ArrayList<>();
        for (List<String> list: mapping.values()) {
            result.add(list);
        }
        
        return result;
    }
}