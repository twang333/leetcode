public class Solution {
    public int nthUglyNumber(int n) {
        int[] array = new int[n+1];
        array[1] = 1;
        int count = 1,  i2 = 1,  i3 = 1,  i5 =1; 
        while(count < n) {
            array[++count] = Math.min(Math.min(2*array[i2], 3*array[i3]), 5*array[i5]);
            if(array[count] == 2*array[i2]) i2++;
            if(array[count] == 3*array[i3]) i3++;
            if(array[count] == 5*array[i5]) i5++;
        }
        return array[n];
    }
}