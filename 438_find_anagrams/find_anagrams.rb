# @param {String} s
# @param {String} p
# @return {Integer[]}
def find_anagrams(s, p)
  return [] if s.size < p.size
  p_hash = build_char_hash(p)
  substring_hash = build_char_hash(s[0...p.size])
  result = []
  (0..(s.size - p.size)).each do |i|
    if substring_hash == p_hash
      result << i
    end

    char_to_remove = s[i..i]
    char_to_add = s[i+p.size..i+p.size]
    if substring_hash[char_to_remove] > 1
      substring_hash[char_to_remove] -= 1
    else
      substring_hash.delete char_to_remove
    end

    if substring_hash[char_to_add]
      substring_hash[char_to_add] += 1
    else
      substring_hash[char_to_add] = 1
    end

  end

  return result
end

def build_char_hash(string)
  string.chars.inject({}) do |result, char|
    if result[char].nil?
      result[char] = 1
    else
      result[char] += 1
    end
    result
  end
end

s, p = ["cbaebabacd", "abc"]
p "s: #{s}; p: #{p}"
p "Expected: [0, 6]"
p "Output: #{find_anagrams(s, p)}"

s, p = ["abab", "ab"]
p "s: #{s}; p: #{p}"
p "Expected: [0, 1, 2]"
p "Output: #{find_anagrams(s, p)}"
