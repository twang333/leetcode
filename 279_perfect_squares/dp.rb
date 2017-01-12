# @param {Integer} n
# @return {Integer}
def num_squares(n)
  dp = [0]
  fixnum_max = 2**62 - 1

  (1..n).each do |i|
    j = 1
    min = fixnum_max
    while j**2 <= i
      min = [min, dp[i - j**2 ] + 1].min
      j += 1
    end

    dp[i] = min
  end

  dp.last
end

n = 12
p "n: #{n}"
p "Expected: 3"
p "Output: #{num_squares(n)}"

n = 13
p "n: #{n}"
p "Expected: 2"
p "Output: #{num_squares(n)}"

n = 7691
p "n: #{n}"
p "Expected: 4"
p "Output: #{num_squares(n)}"
