public class Solution {
    public String simplifyPath(String path) {
        if(null == path) return null;
        Deque<String> stack = new LinkedList<>();
        char[] pathChars = (path+"/").toCharArray();
        
        String subStr = "";
        for(int i = 0; i < pathChars.length; i++) {
            if('/' == pathChars[i]) {
                if(!subStr.isEmpty() && !subStr.equals(".") && !subStr.equals("..")) {
                    stack.push(subStr);
                }
                if(subStr.equals("..") && !stack.isEmpty()) {
                    stack.pop();
                }
                subStr = "";
            } else {
                subStr += String.valueOf(pathChars[i]); 
            }
        }
        
        StringBuilder sb = new StringBuilder();
        sb.append("/");
        while(!stack.isEmpty()) {
            sb.append(deque.pollLast());
            sb.append("/");
        }
        if(sb.length() > 1) sb.delete(sb.length() - 1, sb.length());
        return sb.toString();
        
    }
}