
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

//   Intermediate Algorithm Scripting: Wherefore art thou

function whatIsInAName(collection, source) {
    // What's in a name?
    var arr = [];
    // Only change code below this line
   var srcKeys = Object.keys(source);
  
    return collection.filter(function(obj) {
      return srcKeys.every(function(key) {
        return obj.hasOwnProperty(key) && obj[key] === source[key];
      });
    });
  
    // Only change code above this line
    return arr;
  }
  
  whatIsInAName([{ first: "Romeo", last: "Montague" }, { first: "Mercutio", last: null }, { first: "Tybalt", last: "Capulet" }], { last: "Capulet" });
  
//   Intermediate Algorithm Scripting: Spinal Tap Case

function spinalCase(str) {
    // "It's such a fine line between stupid, and clever."
    // --David St. Hubbins
    // Replace low-upper case to low-space-uppercase
    str = str.replace(/([a-z])([A-Z])/g, "$1 $2");
    // Split on whitespace and underscores and join with dash
    return str
      .toLowerCase()
      .split(/(?:_| )+/)
      .join("-");
  }
  
  spinalCase("This-Is-Spinal-Tap");

  // Intermediate Algorithm Scripting: Pig Latin
  function translatePigLatin(str) {
  
    let consonantRegex = /^[^aeiou]+/;
     let myConsonants = str.match(consonantRegex);
     return myConsonants !== null
       ? str
           .replace(consonantRegex, "")
           .concat(myConsonants)
           .concat("ay")
       : str.concat("way");
   }
   
   translatePigLatin("bcd");
   
  //  Intermediate Algorithm Scripting: Search and Replace

  function myReplace(str, before, after) {
  
    if(/^[A-Z]/.test(before)){
      after = after.charAt(0).toUpperCase() + after.slice(1)
    }
  
  return str.replace(before, after);
  
   // console.log(str.split(" ").includes(before))
  
    
  
  
  }
  
  myReplace("A quick brown fox Jumped over the lazy dog", "Jumped", "leaped");
  
  // Intermediate Algorithm Scripting: DNA Pairing

  function pairElement(str) {
    const pairs = {
      A: 'T',
      T: 'A',
      C: 'G',
      G: 'C'
    }
  
    let arr = str.split('')
    console.log(arr)
  
    console.log(arr.map(item => [item, pairs[item]]))
    return arr.map(item => [item, pairs[item]])
    
  }
  
  pairElement("ATCGA");
  // Intermediate Algorithm Scripting: Missing lettersPassed

  function fearNotLetter(str) {
    for (let i = 1; i < str.length; ++i) {
       if (str.charCodeAt(i) - str.charCodeAt(i - 1) > 1) {
         return String.fromCharCode(str.charCodeAt(i - 1) + 1);
       }
     }
   }
   
   fearNotLetter("abce");
   
  
  //  Intermediate Algorithm Scripting: Sorted Union
  function uniteUnique(...arr) {

    let myArr = arr.flat(1)
  
      
    return myArr.filter((a, b) => myArr.indexOf(a) === b);
  }
  
  uniteUnique([1, 3, 2], [5, 2, 1, 4], [2, 1]);
  

