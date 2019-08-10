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

//   Object Oriented Programming: Understand Where an Object’s Prototype Comes From

function Dog(name) {
    this.name = name;
  }
  
  let beagle = new Dog("Snoopy");
  
  // Add your code below this line
  
  Dog.prototype.isPrototypeOf(beagle)


//   Object Oriented Programming: Use Inheritance So You Don't Repeat Yourself
function Cat(name) {
    this.name = name; 
  }
  
  Cat.prototype = {
    constructor: Cat
     }
  
  
  function Bear(name) {
    this.name = name; 
  }
  
  Bear.prototype = {
    constructor: Bear
  };
  
  function Animal() { }
  
  Animal.prototype = {
    constructor: Animal,
    eat: function() {
      console.log("nom nom nom");
    }
    
  };

//   Object Oriented Programming: Inherit Behaviors from a Supertype

function Animal() { }

Animal.prototype = {
  constructor: Animal, 
  eat: function() {
    console.log("nom nom nom");
  }
};

// Add your code below this line

let duck = Object.create(Animal.prototype); // Change this line
let beagle = Object.create(Animal.prototype); // Change this line

duck.eat(); // Should print "nom nom nom"
beagle.eat(); // Should print "nom nom nom" 

// Object Oriented Programming: Set the Child's Prototype to an Instance of the Parent

function Animal() { }

Animal.prototype = {
  constructor: Animal,
  eat: function() {
    console.log("nom nom nom");
  }
};

function Dog() { }

// Add your code below this line
Dog.prototype = Object.create(Animal.prototype);

let beagle = new Dog();
beagle.eat();  // Should print "nom nom nom"



// Object Oriented Programming: Reset an Inherited Constructor Property /

function Animal() { }
function Bird() { }
function Dog() { }

Bird.prototype = Object.create(Animal.prototype);
Dog.prototype = Object.create(Animal.prototype);

// Add your code below this line
Bird.prototype.constructor = Bird;
Dog.prototype.constructor = Dog;


let duck = new Bird();
let beagle = new Dog();


// Object Oriented Programming: Add Methods After Inheritance

function Animal() { }
Animal.prototype.eat = function() { console.log("nom nom nom"); };

function Dog() { }

// Add your code below this line

Dog.prototype = Object.create(Animal.prototype)

Dog.prototype.bark = () => {
    console.log("Woof!")
}


// Add your code above this line

let beagle = new Dog();

beagle.eat(); // Should print "nom nom nom"
beagle.bark(); // Should print "Woof!"

// Object Oriented Programming: Override Inherited Methods


function Bird() { }

Bird.prototype.fly = function() { return "I am flying!"; };

function Penguin() { }
Penguin.prototype = Object.create(Bird.prototype);
Penguin.prototype.constructor = Penguin;

// Add your code below this line
Penguin.prototype.fly = () => {
    return ("Alas, this is a flightless bird.")
}


// Add your code above this line

let penguin = new Penguin();
console.log(penguin.fly());


// Object Oriented Programming: Use a Mixin to Add Common Behavior Between Unrelated Objects

let bird = {
    name: "Donald",
    numLegs: 2
  };
  
  let boat = {
    name: "Warrior",
    type: "race-boat"
  };
  
  // Add your code below this line
  
  let glideMixin = (obj) => {
      obj.glide = () => {
          console.log("We can glide")
      }
  
  }
  
  glideMixin(bird);
  glideMixin(boat);
  
  
//   Object Oriented Programming: Use Closure to Protect Properties Within an Object from Being Modified Externally


function Bird() {
    let weight = 15;
    
    this.getWeight = () =>{
      return weight;
    }
  }
  
  
  




