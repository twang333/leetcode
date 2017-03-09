public class Solution {
    public boolean isUgly(int num) {
        if(num <= 0) {
            return false;
        } else {
            for(int i = 2; i <=5; i++) {
                while(num % i == 0) num /= i;
            }
            return num == 1;
        }
    }
}