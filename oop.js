function Dog(name) {
    this.name = name;
  }
  
  Dog.prototype.numLegs = 4;
  
  let beagle = new Dog("Snoopy");
  
  let ownProps = [];
  let prototypeProps = [];
  
  // Add your code below this line 
  
  for (let x in beagle) {
    if(beagle.hasOwnProperty(x)) {
      ownProps.push(x);
    } else {
      prototypeProps.push(x)
    }
  }
  
  
  /* jshint expr: true */

function House(numBedrooms) {
    this.numBedrooms = numBedrooms;
  }
  
  // Add your code below this line
  
  let myHouse = new House(5);
  myHouse instanceof House;
  
  function Bird(name) {
    this.name = name;
    this.numLegs = 2;
  }
  
  let canary = new Bird("Tweety");
  let ownProps = [];
  // Add your code below this line
  
  for (let property in canary) {
    if(canary.hasOwnProperty(property)) {
      ownProps.push(property)
    }
  }

  function Dog(name) {
    this.name = name;
  }
  
//   Object Oriented Programming: Understand the Constructor Property
  // Add your code below this line
  function joinDogFraternity(candidate) {
    if( candidate.constructor === Dog) {
      return true;
    } else {
      return false;
    }
  }
  

//   Object Oriented Programming: Change the Prototype to a New Object
  function Dog(name) {
    this.name = name; 
  }
  
  Dog.prototype = {
    // Add your code below this line
    numLegs: 4,
    eat: () => {
      console.log("chew, chew, chew")
    },
    describe: () => {
      console.log("My name is " + this.name)
    }
  };

//   Object Oriented Programming: Remember to Set the Constructor Property when Changing the Prototype

function Dog(name) {
    this.name = name; 
  }
  
  // Modify the code below this line
  Dog.prototype = {
    constructor: Dog,
    numLegs: 2, 
    eat: function() {
      console.log("nom nom nom"); 
    }, 
    describe: function() {
      console.log("My name is " + this.name); 
    }
  };



  