
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

//    Intermediate Algorithm Scripting: Diff Two Arrays

function diffArray(arr1, arr2) {
    var newArr = [];
    // Same, same; but different.
    
    arr1.map((val) => {
      console.log(val)
      !arr2.includes(val) ? newArr.push(val) : val
      console.log(newArr)
    })
    arr2.map((val) => {
      console.log(val)
      !arr1.includes(val) ? newArr.push(val) : val
      console.log(newArr)
    })
  
    return newArr;
  }
  
  diffArray([1, 2, 3, 5], [1, 2, 3, 4, 5]);
  