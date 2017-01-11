# @param {String} s
# @param {String} p
# @return {Integer[]}
def find_anagrams(s, p)
  return [] if s.size < p.size
  p_hash = build_char_hash(p)
  result = []
  (0..(s.size - p.size)).each do |index|
    sub_string = s[index...(index + p.size)]
    if build_char_hash(sub_string) == p_hash
      result << index
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
