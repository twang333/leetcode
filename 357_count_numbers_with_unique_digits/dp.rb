# @param {Integer} n
# @return {Integer}
def count_numbers_with_unique_digits(n)
  return 1 if n == 0
  return 10 if n == 1
  if n > 10
    n = 10
  end
  dp = [1, 10]
  (2..n).each do |i|
    numbers_with_unique_digits = 9
    (1..i-1).each do |j|
      numbers_with_unique_digits *= (10 - j)
    end
    dp[i] = dp[i-1] + numbers_with_unique_digits
  end

  return dp.last
end

n = 2
p "n: #{n}"
p "Expected Result: 91"
p "Output Result: #{count_numbers_with_unique_digits(n)}"

n = 3
p "n: #{n}"
p "Expected Result: 739"
p "Output Result: #{count_numbers_with_unique_digits(n)}"
