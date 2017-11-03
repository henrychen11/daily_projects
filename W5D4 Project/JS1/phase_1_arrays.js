// uniq
Array.prototype.uniq = function(){
  const res = [];
  for(let i = 0; i < this.length; i++){
    if(!res.includes(this[i])){
      res.push(this[i]);
    }
  }
  return res;
};

// console.log([1,2,3,4,4,4,3].uniq());

// twoSum

Array.prototype.twoSum = function() {
  const res = [];
  for(let i = 0; i < this.length; i++){
    for(let j = i+1; j < this.length; j++){
      if(this[i] + this[j] === 0){
        res.push([i,j]);
      }
    }
  }
  return res;
};

// console.log([-1, 0, 2, -2, 1].twoSum());
//
// tran

Array.prototype.trans = function(){
  const transposed = [];
  for(let i = 0; i < this.length; i++){
    transposed.push([]);
    for(let j = 0; j < this[i].length; j++){
      transposed[i].push(this[j][i]);
    }
  }
  return transposed;
};

// console.log([[1,2,3],
            // [4,5,6],
            // [7,8,9]].trans()); //

      // [1,4,7]
      // [2,5,8]
      // [3,6,9]
