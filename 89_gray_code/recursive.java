public class Solution {
    public List<Integer> grayCode(int n) {
        List<Integer> codes = new ArrayList<>();
        codes.add(0);
        for(int i = 0; i < n; i++) {
            for(int j = codes.size() - 1; j >= 0; j--) {
                codes.add(codes.get(j) ^ (1<<i));
            }
        }
        
        return codes;
    }
    
}