public class Solution {
    public int countNumbersWithUniqueDigits(int n) {
        if(0 == n) return 1;
        if(1 == n) return 10;
        if(n > 10) {
            return countNumbersWithUniqueDigits(10);
        } else {
            int other = 1;
            for(int i = n-2; i>= 0; i--){
                other *= (9-i);
            }
            return countNumbersWithUniqueDigits(n-1) + 9 * other;
        }
    }
}