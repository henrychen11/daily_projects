require 'colorize'
require_relative 'cursor.rb'
#require_relative 'board.rb'

class Display
  def initialize(cursor_pos)
    @cursor_pos = cursor_pos
  end

  def render
    @board.each do |row|
      p @board[row]
    end
  end
end
