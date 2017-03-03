public class Solution {
  public List<int[]> kSmallestPairs(int[] nums1, int[] nums2, int k) {
    List<int[]> res = new ArrayList<>();
    PriorityQueue<int[]> pq = new PriorityQueue<>(new Comparator<int[]>(){
      public int compare(int[] a, int[] b) {
        return a[0] + a[1] - b[0] - b[1];
      }
    });

    for (int i = 0;  i < nums2.length; i++ ) {
      pq.offer(new int[]{nums1[0], nums2[i], 0});
    }

    while( k-- > 0 && !pq.isEmpty()) {
      int[] pair = pq.poll();
      res.add(new int[]{pair[0], pair[1]});
      if(pair[2] <= nums1.length - 2) pq.offer(new int[]{nums1[pair[2]+1], pair[1], pair[2]+1});
    }

    return res;
  }
}