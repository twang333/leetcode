# @param {String} s
# @return {Integer}
def calculate(s)
  stack  = []
  result = 0
  number = 0
  sign   = 1
  s.each_char do |char|
    if char =~ /\d/
      number = 10 * number + char.to_i
    elsif "+" == char
      result += sign*number
      number = 0
      sign = 1
    elsif "-" == char
      result += sign*number
      number = 0
      sign = -1
    elsif "(" == char
      stack.push result # result before (
      stack.push sign   # sign before (
      number = 0
      result = 0
      sign = 1
    elsif ")" == char
      result += sign*number
      result *= stack.pop  # sign before (
      result += stack.pop  # result before (
      number = 0
      sign = 1
    end
  end
  
  result += sign*number if number != 0 

  return result
end

p calculate('1+2') # == 3
p calculate('1+2-3') # == 0
p calculate('(33+21)') # == 54
p calculate('(3+21) - 1') # == 23
p calculate('(19-(3+2 + (4+5))') # == 5 
p calculate('5-(2-3)') # == 6
