# @param {String} s
# @return {String}
def shortest_palindrome(s)
	length = s.length
	reverse_s = s.reverse

	tag = length - 1

	(0...length).each do |i|
		if s[0..i] == reverse_s[length - 1 - i..-1]
			tag = length - i - 1
		end

	end

	if tag > 0
		reverse_s[0...tag].concat(s)
	else
		s
	end

end

p shortest_palindrome("a") == "a"
p shortest_palindrome("ab") == "bab"
p shortest_palindrome("aab") == "baab"
p shortest_palindrome("aba") == "aba"
p shortest_palindrome("abac") == "cabac"
