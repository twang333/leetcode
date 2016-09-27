# @param {String} s
# @return {Integer}
def num_decodings(s)
  decoder    = Decorder.new
  decoder.decode s
end

class Decorder
  TWO_DIGITS_MAX = 26
  TWO_DIGITS_MIN = 10
  ONE_DIGIT_MAX  = 9
  ONE_DIGIT_MIN  = 1

  def decode(s)
    return 0 if s.empty?
    result = []
    result[0] = 1

    first = s.slice(0, 1).to_i
    if first <= ONE_DIGIT_MAX && first >= ONE_DIGIT_MIN
      result[1] = 1
    else
      result[1] = 0
    end

    (2..s.length).each do |i|
      result[i] = 0
      one_dight = s.slice(i-1, 1).to_i
      if one_digit_valid? one_dight
        result[i] = result[i-1]
      end

      two_digits = s.slice(i-2, 2).to_i
      if two_digits_valid? two_digits
        result[i] += result[i-2]
      end
    end

    return result.last

  end

  private
  def one_digit_valid?(one_dight)
    one_dight >= ONE_DIGIT_MIN && one_dight <= ONE_DIGIT_MAX
  end

  def two_digits_valid?(two_digits)
    two_digits >= TWO_DIGITS_MIN && two_digits <= TWO_DIGITS_MAX
  end
end
