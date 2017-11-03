Array.prototype.myEach = function(test){
  for(let i = 0; i < this.length; i++){
    test(this[i]);
  }
};

function test(el){
  console.log(el);
}
// console.log([2,"cat","e"].myEach(test));

// Array.prototype.myMap = function(sample) {
//   const res = [];
//   // function myEach(this){
//   //   res.push(func(el));
//   // }
//   // this.myEach(e => res.push(sample(e)));
//
//   this.myEach(function(el){
//     res.push(sample(el));
//   });
//
//   return res;
// };
//
// function samle(num){
//   return num * 2;
// }
//
// console.log([1,2,3].myMap(samle));


Array.prototype.myReduce = function(cup, el) {
  return cup(this)+el;
};
//
function accum(array){
  let sum = 0;
  for(let i = 0; i < array.length; i++){
    sum += array[i];
    console.log(sum);
  }
  return sum;
}
// console.log([1, 2, 3].myReduce(accum, 35));
