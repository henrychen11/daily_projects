function Animal() {
  this.age = 10;

}

Animal.prototype.eat = function eat() {
  console.log('food');
};

function Dog(owner) {
  this.owner = owner;
}

const Lion = function Lion(color) {
  this.color = color;
};

Function.prototype.inherit = function inherit(parent) {
  function Surrogate () {}
  Surrogate.prototype = parent.prototype;
  this.prototype = new Surrogate();
  this.prototype.constructor = this;
};

// Dog.inherit(Animal);

// const Animal = new Animal()
Dog.prototype = Object.create(Animal.prototype);
Dog.prototype.constructor = Dog;

// Lion.prototype = new Surrogate();
// Lion.prototype.constructor = Lion;
const d = new Dog('Reid');
// let l = new Lion('Yellow');
d.eat();
// l.eat();
