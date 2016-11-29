# @param {Integer[]} nums1
# @param {Integer[]} nums2
# @param {Integer} k
# @return {Integer[][]}
def k_smallest_pairs(nums1, nums2, k)
  nums1_size = nums1.size
  nums2_size = nums2.size
  if nums1_size == 0 || nums2_size == 0 || k == 0 
    return []
  end

  possible_k = [k, nums1_size * nums2_size].min
  result = []

  i = 0
  j = 0
  result.push [nums1[i], nums2[j]]

  if nums1.last > nums2.last
    i_flag = true
  else
    j_flag = true
  end

  while(result.size < possible_k)
    if i_flag && (i+1) % nums1_size == 0
      result.push [ nums1[i%nums1_size], nums2[(j+1)%nums2_size] ]
      j += 1
      next
    end

    if j_flag && (j+1) % nums2_size == 0
      result.push [ nums1[(i+1)%nums1_size], nums2[j%nums2_size] ]
      i += 1
      next
    end

    if (i+1) % nums1_size == 0 || (j+1) % nums2_size == 0
      result.push [ nums1[(i+1)%nums1_size], nums2[(j+1)%nums2_size] ]
      i += 1
      j += 1
      next
    end

    candidate1 = [ nums1[(i+1)%nums1_size], nums2[j%nums2_size] ]
    candidate2 = [ nums1[i%nums1_size], nums2[(j+1)%nums2_size] ] 

    if candidate1.reduce(:+) > candidate2.reduce(:+)
      result.push candidate2
      j += 1
    else
      result.push candidate1
      i += 1
    end

  end

  return result
    
end

nums1 = [1,7,11]
nums2 = [2,4,6]
k = 3
p "Given nums1 = [1,7,11], nums2 = [2,4,6], k = 3"
p "Expected: [1,2],[1,4],[1,6]"
p "Actual: #{k_smallest_pairs(nums1, nums2, k)}"

nums1 = [1,1,2]
nums2 = [1,2,3]
k = 2
p "Given nums1 = [1,1,2], nums2 = [1,2,3],  k = 2"
p "Expected: [1,1],[1,1]"
p "Actual: #{k_smallest_pairs(nums1, nums2, k)}"

nums1 = [1,2]
nums2 = [3]
k = 3 
p "Given nums1 = [1,2], nums2 = [3],  k = 3"
p "Expected: [1,3],[2,3]"
p "Actual: #{k_smallest_pairs(nums1, nums2, k)}"

nums1 = [1,1,2]
nums2 = [1,2,3]
k = 10
p "Given nums1 = [1,1,2], nums2 = [1,2,3],  k = 10"
p "Expected: [1,1],[1,1],[2,1],[1,2],[1,2],[2,2],[1,3],[1,3],[2,3]"
p "Actual: #{k_smallest_pairs(nums1, nums2, k)}"
