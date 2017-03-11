def translate(num)
  num_string = num.to_s
  units = "千百十亿千百十万千百十个"
  return "" if num_string.size > units.size
  units = units[units.size - num_string.size..-1]
  result = ""
  num_string.size.times do |i|
    result += "零一二三四五六七八九"[num_string[i].to_i] + units[i]
  end
  result = result[0...-1]
  result.gsub!(/零(千|百|十)/, "零")
  result.gsub!(/零+/,"零")
  result.gsub!(/零(亿|万)/, '\1')

  return result
end

p translate(123)
p translate(103)
p translate(200002002103)