# @param {String} s
# @return {Integer}
def calculate(s)
  return 0 if s.nil? || s.size == 0
  stack = []
  number = 0
  sign = '+'
  index = 0
  length = s.size
  s.each_char do |char|
    index += 1
    if char =~ /\d/
      number = 10 * number + char.to_i
    end

    if ['+', '-', '*', '/'].include?(char) || index == length 
      if "+" == sign 
        stack.push number
      elsif "-" == sign
        stack.push -1 * number
      elsif "*" == sign
        stack.push(stack.pop * number)
      elsif "/" == sign
        stack.last >= 0 ? stack.push(stack.pop / number) : stack.push(stack.pop.abs / number * -1)
      end

      sign   = char
      number = 0
    end
  end

  return stack.reduce(:+)
end


p "1 + 2 * 3 = #{calculate('1 + 2 *3')}" 
p "1 - 2 / 3 = #{calculate('1 - 2 /3')}" 
p "1 + 2 / 3 = #{calculate('1 + 2 /3')}" 
p "1 + 2 - 3 = #{calculate('1 + 2  - 3')}" 
p "1 + 2 + 3 = #{calculate('1 + 2 + 3')}" 
p "0 = #{calculate('0')}" 
