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