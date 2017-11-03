function range(start, end) {


  if (start === end){
    return [end];
  }
  let res = range((start + 1), end);
  res.unshift(start);
  return res;
  // debugger
}

// console.log(range(3,9));

function sumRec(arr) {
  if (arr.length === 0) {
    return 0;
  }
  return arr[0] + sumRec(arr.slice(1));
}
// console.log(sumRec([1,2,3,4]));

function exponent(base, exp) {
  if (exp === 0) {
    return 1;
  }
  return base * exponent(base, (exp - 1));
}
// console.log(exponent(2,6));

function fibonacci(n) {


  if (n === 1){
    return [0];
  }
  if (n === 2){
    return [0,1];
  }

  let res = fibonacci(n-1);
  res.push(res[res.length-1] + res[res.length-2]);
  return res;
}

// console.log(fibonacci(8));


function bsearch(arr, target){
  if (arr.length === 0){
    return -1;
  }
  console.log(arr);
  let mid = Math.floor(arr.length/2);
  console.log("mid:", mid);
  let left = arr.slice(0,mid);
  let right = arr.slice(mid);

  if(target === arr[mid]){
    return mid;
  } else if(target < mid){
    return bsearch(left, target);
  } else {
    return bsearch(right, target) + (mid + 1);
  }
}

console.log(bsearch([9,8,7,6,5],8));
