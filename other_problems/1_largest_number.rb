def largest_number(array)
  result = largest_arrary_candidate(array)
  result.join.to_i
end

def largest_arrary_candidate(array)
  return [] if array.size == 0
  return array if array.size == 1

  x, *xs = *array
  result = largest_arrary_candidate(xs)

  candidates = []
  (result.size + 1).times do |i|
    candidates << result.dup.insert(i, x)
  end

  largest_index = 0
  largest_value = candidates[0].join.to_i

  (1...candidates.size).each do |i|
    candidate_value = candidates[i].join.to_i
    if candidate_value > largest_value
      largest_index = i
      largest_value = candidate_value
    end
  end

  return candidates[largest_index]
end

array = [90, 1, 2, 5]
p "#{array}"
p "Expected: 90521"
p "Output: #{largest_number(array)}"

array = [59, 4, 2, 5]
p "#{array}"
p "Expected: 59542"
p "Output: #{largest_number(array)}"

array = [53, 4, 2, 5]
p "#{array}"
p "Expected: 55342"
p "Output: #{largest_number(array)}"

array = [50, 0, 2, 9]
p "#{array}"
p "Expected: 95020"
p "Output: #{largest_number(array)}"

array = [5130, 5132, 2, 9]
p "#{array}"
p "Expected: 9513251302"
p "Output: #{largest_number(array)}"

array = []
p "#{array}"
p "Expected: 0"
p "Output: #{largest_number(array)}"
