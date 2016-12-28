# @param {Integer[]} nums
# @param {Integer} k
# @param {Integer} t
# @return {Boolean}
def contains_nearby_almost_duplicate(nums, k, t)
  size = nums.size

  k.times do |i|
    (size - i - 1).times do |j|
      if (nums[j+i+1] - nums[j]).abs <= t
        return true
      end
    end
  end

  return false
    
end