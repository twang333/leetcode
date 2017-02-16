# block is implemeted as Proc
# {} is a syntax-sugger
def test_block(&block)
  p block.class
end

test_block { p "hello"}