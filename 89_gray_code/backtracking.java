public class Solution {
    public List<Integer> grayCode(int n) {
        List<Integer> codes = new ArrayList<>();
        codes.add(0);
        generateCodes(codes, n, 0, 1<<n);
        return codes;
    }
    
    private void generateCodes(List<Integer> codes, int n, int current, int size) {
        if(codes.size() == size) return;
        for(int i = 0 ; i < n; i++) {
            int mask = 1 << i;
            int next = current ^ mask;
            if(!codes.contains(next)) {
                codes.add(next);
                generateCodes(codes, n, next, size);
            }
        }
    }
}