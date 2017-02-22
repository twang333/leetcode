public class Solution {
  public int calculate(String s) {
    char sign = '+';
    Deque<Integer> stack = new LinkedList<>();
    int num = 0;
    String str = s + "+";
    for(int i = 0; i < str.length(); i++) {
      if(Character.isDigit(str.charAt(i))) {
        num = 10 * num + str.charAt(i) - '0';
      } else if(str.charAt(i) != ' ') {
        switch (sign) {
          case '-':
            stack.push(num * -1); break;
          case '*':
            stack.push(stack.pop() * num); break;
          case '/':
            stack.push(stack.pop() / num); break;
          default:
            stack.push(num); break;
        }
        sign = str.charAt(i);
        num = 0;
      }
    }
    int result = 0;
    while(!stack.isEmpty()) {
      result += stack.pop();
    }
    return result;
  }
}