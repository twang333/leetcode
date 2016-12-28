# @param {Integer[]} nums
# @param {Integer} m
# @return {Integer}
# dp[s,j] is the solution for splitting subarray n[j]...n[L-1] into s parts.
#dp[s+1,i] = min{ max(dp[s,j], n[i]+...+n[j-1]) }, i+1 <= j <= L-s
def split_array(nums, m)
	l = nums.size
	sums = [0]
	nums.each_with_index do |num, index|
		sums << sums[index] + num
	end

	dp = []
	l.times do |index|
		dp[index] = sums[l] - sums[index]
	end

	(2..m).each do |s|
		(0..l-s).each do |i|
			(i+1..l-s+1).each do |j|
				t = [dp[j], sums[j] - sums[i]].max
				if (t <= dp[i])
					dp[i] = t
				else
					break
				end
			end
		end
	end

	return dp[0]
end
