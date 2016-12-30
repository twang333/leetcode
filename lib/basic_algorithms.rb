def quick_sort(array)
  return array if array.size < 2
  privot = array.first

  left, right = array[1..-1].partition do |x| 
    x < privot
  end
  quick_sort(left) + [privot] + quick_sort(right)
end
