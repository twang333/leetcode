def fabonacci
  memo = [0, 1, 2]

  lambda = lambda do |i|
    result = memo[i]
    if result.nil?
      result = lambda.call(i-1) + lambda.call(i-2)
    end
    return result
  end

  return lambda
end

lambda = fabonacci

10.times do |i|
  p lambda.call(i)
end 
