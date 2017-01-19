# @param {String} s
# @param {String} p
# @return {Integer[]}
def find_anagrams(s, p)
  return [] if s.size < p.size
  hash_array = Array.new(256, 0)
  p.chars.each do |char|
    hash_array[char.ord] += 1
  end

  left  = 0
  right = 0 
  count = p.size

  result = []
  while right < s.size
    right_char_int = s[right].ord
    if hash_array[right_char_int] >= 1
      count -= 1
    end
    hash_array[right_char_int] -= 1
    right += 1

    if count == 0
      result << left
    end

    if (right - left) == p.size
      left_char_int = s[left].ord
      if hash_array[left_char_int] >= 0
        count += 1
      end
      hash_array[left_char_int] += 1
      left += 1
    end
  end

  return result
end

s, p = ["cbaebabacd", "abc"]
p "s: #{s}; p: #{p}"
p "Expected: [0, 6]"
p "Output: #{find_anagrams(s, p)}"

s, p = ["abab", "ab"]
p "s: #{s}; p: #{p}"
p "Expected: [0, 1, 2]"
p "Output: #{find_anagrams(s, p)}"
