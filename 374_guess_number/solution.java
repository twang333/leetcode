/* The guess API is defined in the parent class GuessGame.
   @param num, your guess
   @return -1 if my number is lower, 1 if my number is higher, otherwise return 0
      int guess(int num); */

public class Solution extends GuessGame {
    public int guessNumber(int n) {
      int left  = 1;
      int right = n;
      while (left <= right) {
        int pick = left + (right - left)/2;
        int result = guess(pick);

        if(result == 0) {
          return pick;
        } else if (result == -1) {
          right = pick - 1;
        } else {
          left = pick + 1;
        }

      }

      return 0;
        
    }
}