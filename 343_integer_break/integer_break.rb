# @param {Integer} n
# @return {Integer}
def integer_break(n)
  if n > 58 || n < 2
    return -1
  end

  result = Array.new(n+1, nil)
  result[2] = 1
  result[3] = 2

  (4..n).each do |i|
    result[i] = prime_less_or_equal(i/2).map do |prime|
      left_operand  = [prime, result[prime]].max
      right_operand = [i - prime, result[i - prime]].max
      left_operand * right_operand
    end.max
  end

  return result[n]

end

def prime_less_or_equal(i)
  result = []
  prime_less_than_30.each do |prime|
    if prime > i
      break
    else
      result << prime
    end
  end
  result
end

def prime_less_than_30
  [2, 3, 5, 7, 11, 13, 17, 23, 29]
end

p integer_break(2) == 1
p integer_break(3) == 2
p integer_break(4) == 4
p integer_break(5) == 6
p integer_break(10) == 36
p integer_break(12) == 81
