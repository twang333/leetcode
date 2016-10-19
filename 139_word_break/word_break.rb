# @param {String} s
# @param {Set<String>} word_dict
# @return {Boolean}
def word_break(s, word_dict)
  result = Array.new(s.size + 1, false)
  result[0] = true

  (1..s.size).each do |i|
    (0...i).each do |j|
      if result[j] && word_dict.include?(s[j...i])
        result[i] = true
        break
      end
    end
  end

  return result[s.size]
end
