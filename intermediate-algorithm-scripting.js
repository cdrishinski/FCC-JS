
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
  
//   Intermediate Algorithm Scripting: Seek and Destroy
function destroyer(arr) {
    // Remove all the values
    let arrayOfArgs = [...arguments]
    let list = arrayOfArgs[0];
    let destroy = [];
  
    for (var i = 1; i < arrayOfArgs.length; i++) {
      destroy.push(arrayOfArgs[i])
    }
  
    destroy.map((val, ind) => {
      list.map((val2, ind2) => {
        console.log(val, val2)
  
        val === val2 ? delete list[ind2] : val
      }
      )
    })
  
    return list.filter(function (el) {
      return el != "";
    });
  }
  
  
  destroyer([3, 5, 1, 2, 2], 1, 2, 3);

  


  