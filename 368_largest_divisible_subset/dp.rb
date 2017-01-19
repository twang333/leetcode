# @param {Integer[]} nums
# @return {Integer[]}
def largest_divisible_subset(nums)
  n = nums.size
  return [] if n < 1
  sorted_nums = nums.sort
  dp = [[sorted_nums[0]]]

  (1...n).each do |i|
    subset_without_i = dp[i-1]

    largest_divisible_index = -1
    (0..i-1).to_a.reverse.each do |j|
      if sorted_nums[i] % dp[j].last == 0
        largest_divisible_index = j
        break
      end
    end

    if largest_divisible_index == -1
      subset_with_i = [sorted_nums[i]]
    else
      subset_with_i = dp[largest_divisible_index] + [sorted_nums[i]] 
    end

    if subset_without_i.size > subset_with_i.size
      dp[i] = subset_without_i
    else
      dp[i] = subset_with_i
    end
  end

  return dp.last
end
