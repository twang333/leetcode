# @param {Integer[]} nums
# @return {Integer}
# result = result ^ a ^ a
def missing_number(nums)
  result = 0
  nums.each_with_index do |num, index|
    result = result ^ index ^ num
  end

  result ^ nums.size
end

# p 0 == missing_number([])
# p 1 == missing_number([0])
# p 2 == missing_number([0,1,3])
# p 3 == missing_number([0,1,2])
# p 3 == missing_number([2,1,0])
# p 3 == missing_number([1,0,2])
# p 0 == missing_number([1,2,3])
