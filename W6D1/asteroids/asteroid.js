const utils = require ('./util.js');
const MovingObject = require ('./moving_object.js');
const COLOR = 'blue';
const RADIUS = 10;
const Asteroid = function Asteroid(options) {
  MovingObject.call(this, options);
  this.radius = RADIUS;
  this.color = COLOR;
};

utils.inherits(Asteroid, MovingObject);

module.exports = Asteroid;
