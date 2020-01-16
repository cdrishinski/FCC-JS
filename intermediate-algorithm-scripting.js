
// Intermediate Algorithm Scripting: Sum All Numbers in a Range

function sumAll(arr) {
    arr.sort(function(a,b){return a - b})
     let sum = 0;
     let firstNum = arr[0];
     let secNum = arr[1];
   
    for(var i = firstNum+1; i < secNum; i++){
       arr.push(i)
     }
    arr
     .sort(function(a,b){return a - b})
     .map(num => sum += num)
   
   return sum
   }
   
   sumAll([1, 5]);