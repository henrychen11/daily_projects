const Game = require('./game.js');


const canvas = document.getElementById("canvas");
canvas.width = Game.dim_x;
canvas.height = Game.dim_y;

const ctx = canvas.getContext("2d");
ctx.fillStyle = "purple";
ctx.fillRect(0, 0, 500, 500);
Game.draw(ctx);

setInterval(function() {
  Game.draw(ctx);
  Game.moveObjects();
}, 10);
// module.exports = view;
