def selection_sort(array)
  return [array].flatten.compact if array.size <= 1
  array.each_with_index do |item, i|
    min_value = item
    min_index = i

    array[(i+1)..-1].each_with_index do |value, j|
      if value < min_value
        min_value = value 
        min_index = j + i + 1
      end
    end


    if i != min_index
      # swap i & min_index
      temp             = array[i]
      array[i]         = array[min_index]
      array[min_index] = temp
    end

  end

  return array
end


array = []
p "array = #{array}"
p "Expected: []"
p "Output: #{selection_sort(array)}"

array = [4,3,1,5,8,1]
p "array = #{array}"
p "Expected: [1,1,3,4,5,8]"
p "Output: #{selection_sort(array)}"
