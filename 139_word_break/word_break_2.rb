# @param {String} s
# @param {Set<String>} word_dict
# @return {Boolean}
def word_break(s, word_dict)
  result = Array.new(s.size + 1, false)
  result[0] = true

  (1..s.size).each do |index|
    sub_s = s[0...index]
    sub_word_dict = word_dict.select {|word| word.size <= sub_s.size}
    sub_word_dict.each do |word|
      prefix_index = sub_s.size - word.size
      if result[prefix_index] && word == sub_s[prefix_index..-1]
        result[index] = true
        break
      end
    end
  end

  return result[s.size]
end
