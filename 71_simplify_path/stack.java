public class Solution {
    public String simplifyPath(String path) {
        if(null == path) return null;
        Deque<String> deque = new LinkedList<>();
        char[] pathChars = (path+"/").toCharArray();
        
        String subStr = "";
        for(int i = 0; i < pathChars.length; i++) {
            if('/' == pathChars[i]) {
                if(!subStr.isEmpty() && !subStr.equalsIgnoreCase(".") && !subStr.equalsIgnoreCase("..")) {
                    deque.push(subStr);
                }
                if(subStr.equalsIgnoreCase("..") && !deque.isEmpty()) {
                    deque.pop();
                }
                subStr = "";
            } else {
                subStr += String.valueOf(pathChars[i]); 
            }
        }
        
        StringBuilder sb = new StringBuilder();
        sb.append("/");
        while(!deque.isEmpty()) {
            sb.append(deque.pollLast());
            sb.append("/");
        }
        if(sb.length() > 1) sb.delete(sb.length() - 1, sb.length());
        return sb.toString();
        
    }
}