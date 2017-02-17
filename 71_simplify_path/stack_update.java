public class Solution {
    public String simplifyPath(String path) {
        if(null == path) return null;
        Deque<String> stack = new LinkedList<>();
        Set<String> skip = new HashSet<>(Arrays.asList("..", ".", ""))
        char[] pathChars = (path+"/").toCharArray();
        String subStr = "";
        for(int i = 0; i < pathChars.length; i++) {
            if('/' == pathChars[i]) {
                if(!skip.contains(subStr)) stack.push(subStr);
                else if (subStr.equals("..") && !stack.isEmpty()) stack.pop();
                subStr = "";
            } else {
                subStr += String.valueOf(pathChars[i]); 
            }
        }

        String res = "";
        for(String str: stack) res = "/" + str + res;
        return res.isEmpty() ? "/" : res;
    }
}