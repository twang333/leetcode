public class Solution {
	public int[] nextGreaterElements(int[] nums) {
		if(null == nums) return null;
		int l = nums.length;
		int[] res = new int[l];
		Arrays.fill(res, -1);
		Deque<Integer> stack = new LinkedList<>();

		for(int i = 0; i < 2*l; i++) {
			while(!stack.isEmpty() && nums[stack.peek()] < nums[i%l]) 
				res[stack.pop()] = nums[i%l];

			if( i < l) 
				stack.push(i);
		}

		return res;
	}
}