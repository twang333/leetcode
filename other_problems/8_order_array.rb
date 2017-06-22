def reorder(array)
  return []
end

def to_index(index, length)
  if( index < length / 2 || 2 * index == length - 1) 
    return 2 * index
  else
    return 2 * (length - index) - 1
  end
end

array = [1,2,3,4,5]
p array
p "#{reorder(array)} equals [1,5,2,4,3]"

array = [1,2,3,4,5,6]
p array
p "#{reorder(array)} equals [1,6,2,5,3,4]"
