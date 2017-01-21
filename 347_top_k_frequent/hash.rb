def top_k_frequent(nums, k)
	counter_hash = nums.inject({}) do |result, item|
		if result[item]
			result[item] += 1
		else
			result[item] = 1
		end
		result
	end

	sorted_counter_nums = counter_hash.to_a.sort do |item1, item2| 
		item2[1] <=> item1[1]
	end

	sorted_counter_nums[0...k].map { |item| item[0] }
end

nums = [1,1,1,2,2,3]
k = 2
p "nums: #{nums}; k: #{k}"
p "Expected: [1,2]"
p "Outputed: #{top_k_frequent(nums, k)}"
