function sum() {
  let args = Array.from(arguments);
  let total = 0;
  args.forEach(function(el) {
    total += el;
  });
  return total;
}
// console.log(sum(5,4,6));

let total = 0;
function sumrest(...args) {
  args.forEach(function(el){
    total += el;
  });
  return total;
}
// console.log(sumrest(5,4,6));

//===========================================================
class Cat {
  constructor(name) {
    this.name = name;
  }

  says(sound, person) {
    console.log(`${this.name} says ${sound} to ${person}!`);
    return true;
  }
}

const markov = new Cat("Markov");
const breakfast = new Cat("Breakfast");


Function.prototype.myBind = function myBind(context, ...args) {
  // console.log(this);
  // console.log(context);
  // console.log(arguments);
  // return this.apply(arg1);

  // return this.apply(context, [arg1, arg2]);
  // console.log(args);
  let func = this;
  return function(...args2) {
    // console.log(args);
    // args3 =
    let args3 = args.concat(args2);
    func.apply(context, args3);
    return true;
  };
};

// markov.says.myBind(breakfast, "meow", "Kush")();
// markov.says.myBind(breakfast)("meow", "a tree");
// markov.says.myBind(breakfast, "meow")("Markov");
//
//
// const notMarkovSays = markov.says.myBind(breakfast);
//
// console.log(notMarkovSays("meow", "me"));

function curriedSum(numArgs) {
  let numbers = [];

  return function _curriedSum(num) {
    numbers.push(num);
    if (numbers.length === numArgs) {
      // console.log(numbers);
      let result = numbers.reduce(function(t, el) {
        return t + el;
      });
      return result;
    } else {
      // console.log(num);
      return _curriedSum;
    }
  };
}

// const test = curriedSum(4);
// console.log(test(5)(30)(20)(1));

class Bunny {
  constructor (name) {
    this.name = name;
  }
}

let h = new Bunny('Reid');

Function.prototype.curry = function curry(numArgs) {
  let args = [];
  let func = this;
  return function _curries(arg) {
    args.push(arg);
    if (args.length === numArgs){
      console.log(args);
      // return func.apply(null, args);
      return func.call(null, ...args);
    } else {
      return _curries;
    }
  };
};

function test(a,b,c) {
  // console.log(this);
  return a+b+c;
}
console.log(test.curry(3)(3)(2)(5));








//
