def max_area(height)
	return 0 if height.size < 2
	left = 0
	right = height.size - 1
	area = 0
	while left < right
		area = [area, calculate_area(left, right, height[left], height[right])].max

		if height[left] <= height[right]
			left += 1
		else
			right -= 1
		end
	end

	area
end

def calculate_area(left, right, left_height, right_height)
	(right - left) * [left_height, right_height].min
end

p max_area([1,1])