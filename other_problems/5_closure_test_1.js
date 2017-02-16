var memorizer = function (memo, formula) {
  var recur = function(n) {
    var result = memo[n];
    if (typeof result !== 'number') {
      result = formula(recur, n);
      memo[n] = result;
    }
    return result;
  }

  return  recur;
};

var fibonacci = memorizer([0, 1], function(recur, n) {
  return recur(n-1) + recur(n-2);
});

var factorial = memorizer([1, 1], function(recur, n) {
  return n * recur(n-1);
});

console.log(fibonacci(10));
console.log(factorial(3));
