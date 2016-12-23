def sqrt(value, difference)
  left = 0
  right = value

  middle = (right + left)/2.to_f

  while true 
    result = check(difference, value, middle)

    if result == 0 
      break
    end

    if result == 1
      left = middle
      middle = (middle + right) / 2.to_f
    end

    if result == -1
      right = middle
      middle = (left + middle) / 2.to_f
    end
  end
  return middle
end

def check(difference, value, sqrt_value)
  more = (sqrt_value + difference) * (sqrt_value + difference)
  less = (sqrt_value - difference) * (sqrt_value - difference) 
  if more >= value && less <= value
    return 0
  end

  if more < value
    return 1
  end

  if less > value
    return -1
  end
end

value = 9
difference = 0.3
p "value = #{value}; difference = #{difference}"
p "Expected Result: 2.7 - 3.3"
p "Output Result: #{sqrt(value, difference)}"

value = 10
difference = 0.01
p "value = #{value}; difference = #{difference}"
p "Expected Result: #{Math.sqrt(value) - difference} - #{Math.sqrt(value) + difference}"
p "Output Result: #{sqrt(value, difference)}"