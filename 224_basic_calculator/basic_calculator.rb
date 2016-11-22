# @param {String} s
# @return {Integer}
def calculate(s)
  s.gsub!(/ /, '')
  catch(:error) do
    process_result = process(s)
    return do_calculation(process_result)
  end

end

def process(s)
  operand_cache = ''
  result = []
  s.each_char do |char|
    if char =~ /\d/
      operand_cache += char
    elsif char =~ /\+|\-/
      result.push operand_cache.to_i
      operand_cache = ''
      result.push char
    elsif '(' == char
      if '' != operand_cache
        throw :error, :invalid_express
      end
      result.push char
    elsif ')' == char
      result.push char
    else
      throw :error, :invalid_express
    end
  end
end

def do_calculation(array)
  stack = []
  array.each do |item|
    if item =~ /\+|\-|\(/
      stack.push item
    elsif ')' == item
      value = stack.pop
      
    else
      if stack.last =~ /\+|\-/
        operator = stack.pop
        operand_left = stack.pop
        result = operate(operand_left, operator, item)
        stack.push result
      end
    end
  end
end

def operate(num1, operator, num2)
  if num1.nil? || num2.nil?
    throw :error, :invalid_express
  end
  if '+' == operator 
    num1 + num2
  else 
    num1 - num2
  end
end

p calculate('1+2') == 3
p calculate('1+2-3') == 0
p calculate('(33+21)') == 54
p calculate('(3+21) - 1') == 23
p calculate('(19-(3+2 + (4+5))') == 5 
p calculate('5-(2-3)') == 6

p calculate('1+') == :invalid_express
p calculate('-1') == :invalid_express
p calculate('22(') == :invalid_express
p calculate('22)') == :invalid_express
p calculate('4+(') == :invalid_express
