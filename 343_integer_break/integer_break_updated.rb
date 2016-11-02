# @param {Integer} n
# @return {Integer}
def integer_break(n)
  if n < 2
    return nil
  end

  if 2 == n
    return 1
  end

  if 3 == n
    return 2
  end

  quotient = n / 3
  if 1 == n % 3
    return 4 * 3 ** (quotient - 1)
  elsif 2 == n % 3
    return 2 * 3 ** quotient
  else
    return 3 ** quotient
  end

end

p integer_break(2) == 1
p integer_break(3) == 2
p integer_break(4) == 4
p integer_break(5) == 6
p integer_break(10) == 36
p integer_break(12) == 81
