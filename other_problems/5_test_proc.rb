# return in proc is weried.
def test_proc
  p "test proc"
  proc = Proc.new do
    return "c"
  end
  proc.call
  p "hello world"
end

def test_lambda
  p "test lambda"
  lambda = lambda { return "c" }
  lambda.call
  p "hello world"
end

p test_proc
p test_lambda
