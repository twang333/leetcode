def move_zero_to_end(array)
  count = 0
  array.each_with_index do |item, i|
    if item != 0
      if count != i
        array[count] = item
        array[i] = 0
      end
      count += 1
    end
  end
end

a = [1,3,3]
p a
move_zero_to_end(a)
p a

a = [0,1,2]
p a
move_zero_to_end(a)
p a

a = [1,0,1]
p a
move_zero_to_end(a)
p a

a = [1,1,0]
p a
move_zero_to_end(a)
p a
