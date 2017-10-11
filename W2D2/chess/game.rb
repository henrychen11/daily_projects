require_relative 'player.rb'
require_relative 'display.rb'
require_relative 'board.rb'

class Game
  def initialize
    @board = Board.new
    @display = Display.new(@board)
  end

  def play
    while true
    @display.render
    end
  end

end





if __FILE__ == $PROGRAM_NAME
  Game.new.play
end
