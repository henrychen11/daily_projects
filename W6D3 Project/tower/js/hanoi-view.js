class View {
  constructor(game, $el){
    this.game = game;
    this.setupTowers();
  }
  
  setupTowers(){
    for (let i = 0; i < 3; i++) {
      const $tower = $('<ul></ul>');
      $('figure').append($tower);
      $tower.data( {towerIdx: i } );
      $tower.addClass('tower');
      // console.log($tower.data("towerIdx"));
      if (i === 1) {
        this.setupDisk();
      }
    }
  }
  
  setupDisk(){
    for (let i = 0; i < 3; i++) {
      const $disk = $('<li></li>');
      $disk.addClass('disks' + i);
      this.append($disk);
    }
  }
}

module.exports = View;