# @param {String} s
# @return {String}
def shortest_palindrome(s)
	length    = s.length
	reverse_s = s.reverse
	(0...length).to_a.reverse.each do |i|
		if s.start_with?(reverse_s[length-1-i..-1])
			return reverse_s[0...length-1-i].concat(s)
		end
	end
end

p shortest_palindrome("a") == "a"
p shortest_palindrome("ab") == "bab"
p shortest_palindrome("aab") == "baab"
p shortest_palindrome("aba") == "aba"
p shortest_palindrome("abac") == "cabac"
