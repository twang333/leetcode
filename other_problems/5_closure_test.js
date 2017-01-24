var fibonacci = function (i) {
  console.log("fibonacci")
  memo = [0, 1, 2];

  var fib = function(i) {
    var result = memo[i];
    if(typeof result !== "number") {
      console.log("fib")
      result = fib(i-1) + fib(i-2);
      memo[i] = result;
    }
    return result;
  };

  return fib;
}();

for(var i = 0; i < 10; i++) {
  console.log(fibonacci(i))
}