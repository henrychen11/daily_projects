Array.prototype.bubbleSort = function bubbleSort() {
  let temp;
  for(var i = 0; i <= this.length; i++){
    for(var j = 0; j <= this.length; j++){
      if(this[i] < this[j]){
        temp = this[i];
        this[i] = this[j];
        this[j] = temp;
      }
    }
  }
  return this;
};
// console.log([1,2,7,6,5,4,3,8,9].bubbleSort());

String.prototype.substrings = function substrings() {
  const res = [];
  const temp = this.split('');

  for (let i = 0; i <= temp.length; i++){
    for (let j = i + 1; j <= temp.length; j++){
      // console.log(temp.slice(i,j).join(''));
      res.push(temp.slice(i,j).join(''));
    }
  }
  // return res.filter(e => e !== "");
  return res
};

// console.log("hello".substrings());
