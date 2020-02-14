
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
  
  // Intermediate Algorithm Scripting: Convert HTML Entities

  function convertHTML(str) {
    // &colon;&rpar;
   return str.replace(/&/g, "&amp;").replace(/>/g, "&gt;").replace(/</g, "&lt;").replace(/"/g, "&quot;").replace(/'/g, "&apos;");
  
  }
  
  convertHTML("Dolce & Gabbana");

  // Intermediate Algorithm Scripting: Sum All Odd Fibonacci Numbers

  function sumFibs(num) {
    var prevNumber = 0;
    var currNumber = 1;
    var result = 0;
    while (currNumber <= num) {
      if (currNumber % 2 !== 0) {
        result += currNumber;
      }
  
      currNumber += prevNumber;
      prevNumber = currNumber - prevNumber;
    }
  
    return result;
  }
  
  // test here
  sumFibs(4);
  
  // Intermediate Algorithm Scripting: Sum All Primes

  function sumPrimes(num) {
    var res = 0;
  
    // Function to get the primes up to max in an array
    function getPrimes(max) {
      var sieve = [];
      var i;
      var j;
      var primes = [];
      for (i = 2; i <= max; ++i) {
        if (!sieve[i]) {
          // i has not been marked -- it is prime
          primes.push(i);
          for (j = i << 1; j <= max; j += i) {
            sieve[j] = true;
          }
        }
      }
  
      return primes;
    }
  
    // Add the primes
    var primes = getPrimes(num);
    for (var p = 0; p < primes.length; p++) {
      res += primes[p];
    }
  
    return res;
  }
  
  // test here
  sumPrimes(10);

  // Intermediate Algorithm Scripting: Smallest Common Multiple

  function smallestCommons(arr) {
    var range = [];
    for (var i = Math.max(arr[0], arr[1]); i >= Math.min(arr[0], arr[1]); i--) {
      range.push(i);
    }
  
    // can use reduce() in place of this block
    var lcm = range[0];
    for (i = 1; i < range.length; i++) {
      var GCD = gcd(lcm, range[i]);
      lcm = (lcm * range[i]) / GCD;
    }
    return lcm;
  
    function gcd(x, y) {
      // Implements the Euclidean Algorithm
      if (y === 0) return x;
      else return gcd(y, x % y);
    }
  }
  
  // test here
  smallestCommons([1, 5]);

  // Intermediate Algorithm Scripting: Drop it

  function dropElements(arr, func) {
    return arr.slice(arr.findIndex(func) >= 0 ? arr.findIndex(func) : arr.length);
  }
  
  // test here
  dropElements([1, 2, 3, 4], function(n) {
    return n >= 3;
  });

  // Intermediate Algorithm Scripting: Steamroller

  function steamrollArray(arr) {
    let flat = [].concat(...arr);
    return flat.some(Array.isArray) ? steamrollArray(flat) : flat;
  }
  
  steamrollArray([1, [2], [3, [[4]]]]);

  





