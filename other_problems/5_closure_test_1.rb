def memorizer(memo, formula)
  lambda = lambda do |n|
    result = memo[n]

    if result.nil?
      result = formula.call(lambda, n)
      memo[n] = result
    end
    return result
  end

  return lambda
end

fibonacci = memorizer([0, 1], lambda { |recur, n| return recur.call(n-1) + recur.call(n-2) })
factorial = memorizer([1, 1], lambda { |recur, n| return recur.call(n-1) * n})

p fibonacci.call(10)
p factorial.call(3)
