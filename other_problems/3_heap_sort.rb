def heap_sort(array)
  return [array].flatten.compact if array.size <= 1

  array[1..-1].each_with_index do |item, i|
    index = i + 1
    parent_index = (( index - 1) / 2.0).floor
    while array[parent_index] > array[index]
      # swap parent_index & i + 1
      temp = array[index]
      array[index] = array[parent_index]
      array[parent_index] = temp

      index = parent_index
      parent_index = ((parent_index - 1) / 2.0).floor
    end

  end

  return array
end

array = []
p "array = #{array}"
p "Expected: []"
p "Output: #{heap_sort(array)}"

array = [4,3,1,5,8,1]
p "array = #{array}"
p "Expected: [1,4,1,5,8,3]"
p "Output: #{heap_sort(array)}"
