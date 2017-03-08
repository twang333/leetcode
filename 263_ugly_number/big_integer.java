import java.math.BigInteger;
public class Solution {
  public boolean isUgly(int num) {
    if(num <= 0) {
      return false;
    } else {
      BigInteger bigInt = BigInteger.valueOf(30);
      return bigInt.pow(32).mod(BigInteger.valueOf(num)).equals(BigInteger.valueOf(0));
    }
  }
}