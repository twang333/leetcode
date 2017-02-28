public class Solution {
	public String frequencySort(String s) {
		Map<Character, Integer> map = new HashMap<>();
		for(Character c : s.toCharArray()) {
			if (map.containsKey(c)) {
				map.put(c, map.get(c) + 1);
			} else {
				map.put(c, 1);
			}
		}

		PriorityQueue<Map.Entry<Character, Integer>> pg = new PriorityQueue<>(
			new Comparator<Map.Entry<Character, Integer>>() {
				@Override
				public int compare(Map.Entry<Character, Integer> a, Map.Entry<Character, Integer> b) {
					return b.getValue() - a.getValue();
				}
			}
		);
		pg.addAll(map.entrySet());

		StringBuilder sb = new StringBuilder();
		while(!pg.isEmpty()) {
			Map.Entry entry = pg.poll();
			for(int i = 0; i < (int)entry.getValue(); i++) {
				sb.append(entry.getKey());
			}
		}

		return sb.toString();
	}
}