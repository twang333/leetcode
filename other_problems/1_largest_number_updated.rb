def largest_number(array)
  result = array.sort do |x, y|
    [y, x].join.to_i <=> [x, y].join.to_i
  end

  result.join.to_i
end

array = [90, 1, 2, 5]
p "array = #{array}"
p "Expected: 90521"
p "Output: #{largest_number(array)}"

array = [59, 4, 2, 5]
p "array = #{array}"
p "Expected: 59542"
p "Output: #{largest_number(array)}"

array = [53, 4, 2, 5]
p "array = #{array}"
p "Expected: 55342"
p "Output: #{largest_number(array)}"

array = [50, 0, 2, 9]
p "array = #{array}"
p "Expected: 95020"
p "Output: #{largest_number(array)}"

array = [5130, 5132, 2, 9]
p "array = #{array}"
p "Expected: 9513251302"
p "Output: #{largest_number(array)}"

array = []
p "array = #{array}"
p "Expected: 0"
p "Output: #{largest_number(array)}"
