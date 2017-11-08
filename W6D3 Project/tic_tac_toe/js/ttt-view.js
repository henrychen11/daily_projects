class View {
  constructor(game, $el) {
    this.game = game; 
    this.setupBoard();
    this.bindEvents();

  }

  bindEvents() {
    $('ul').on("click", "li", event => {
      $(event.currentTarget).removeClass('unclick');
      $(event.currentTarget).addClass('click');
      this.makeMove($(event.currentTarget));
    });
  }

  makeMove($square) {
    this.game.playMove($square.data("pos"));
    $square.text(this.game.currentPlayer);
  }

  setupBoard() {
    let $ul = $('<ul></ul>');

    $('figure').append($ul);
    for (let i = 0; i < 3; i++) {
      for (let j = 0; j < 3; j++) {
        let $square = $('<li></li>');
        $square.addClass('unclick');
        $square.data( {pos:[i, j]});
        // console.log([i, j]);
        console.log($square.data("pos"));
        $('ul').append($square);

      }
    }

  }
}

module.exports = View;
