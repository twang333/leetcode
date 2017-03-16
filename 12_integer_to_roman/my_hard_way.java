public class Solution {
    public String intToRoman(int num) {
        if(num <= 0 || num >= 4000) return "";
        StringBuilder sb = new StringBuilder();
       
        char[] ones = new char[]{'I', 'X', 'C', 'M'};
        char[] fives = new char[]{'V', 'L', 'D'};
        
        for(int i = 4; i >= 1; i--){
            int unit = (int)Math.pow(10, i-1);
            int digit = num / unit;
            num = num % unit;
            switch(digit){
            case 9:
                sb.append(ones[i-1]);
                sb.append(ones[i]);
                break;
            case 8:
                sb.append(fives[i-1]);
                sb.append(ones[i-1]);
                sb.append(ones[i-1]);
                sb.append(ones[i-1]);
                break;
            case 7:                
                sb.append(fives[i-1]);
                sb.append(ones[i-1]);
                sb.append(ones[i-1]);
                break;
            case 6:
                sb.append(fives[i-1]);
                sb.append(ones[i-1]);
                break;
            case 5:
                sb.append(fives[i-1]);
                break;
            case 4:
                sb.append(ones[i-1]);
                sb.append(fives[i-1]);
                break;
            case 3:
                sb.append(ones[i-1]);
                sb.append(ones[i-1]);
                sb.append(ones[i-1]);
                break;
            case 2:
                sb.append(ones[i-1]);
                sb.append(ones[i-1]);
                break;
            case 1:
                sb.append(ones[i-1]);
                break;
            }
        }
        
        return sb.toString();
    }
}