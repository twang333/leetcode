public class Solution {
    public boolean isPowerOfTwo(int n) {
        if(n <= 0) return false;
        if(1 == n) return true;
        int r = n % 2;
        if ( 1 == r) {
            return false;
        } else {
            return isPowerOfTwo(n/2);
        }
    }
}