// https://discuss.leetcode.com/topic/30508/easiest-java-solution-with-graph-explanation/2
// o(n*m)
public class Solution {
    public String multiply(String num1, String num2) {
        int l1 = num1.length(); int l2 = num2.length();
        int[] result = new int[l1+l2];
        for(int i = l1-1; i >= 0; i--) {
            for(int j = l2-1; j >=0; j--) {
                int d1 = num1.charAt(i) - '0';
                int d2 = num2.charAt(j) - '0';
                int sum = d1*d2 + result[i+j+1];
                result[i+j+1] = sum % 10;
                result[i+j] += sum / 10; 
            }
        }
        StringBuilder sb = new StringBuilder();
        for(int i : result) if(sb.length() > 0 || i > 0) sb.append(i);
        return sb.length() == 0 ? "0" : sb.toString();
    }
}