# @param {String} s
# @return {Integer}
def num_decodings(s)
  return 0 if s.empty?
  decoder    = Decorder.new
  decoder.decode s
end

class Decorder
  MAX = 26
  MIN = 1

  def decode(s)
    return 1 if s.empty?

    if 1 == s.size
      if s.to_i > 0 && s.to_i <= 9
        return 1
      else
        return 0
      end
    end

    result = 0 

    last = s.slice(-1, 1).to_i
    if last > 0 && last <= 9
      result += decode(s.slice(0...-1))
    end

    last_two = s.slice(-2, 2).to_i
    if last_two > 9 && last_two <= 26
      result += decode(s.slice(0...-2))
    end

    return result

  end
end
