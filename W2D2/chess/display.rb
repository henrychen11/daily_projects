require 'colorize'
require_relative 'cursor.rb'

class Display

  attr_reader :board, :cursor

  def initialize(board)
    @board = board
    @cursor = Cursor.new([0,0], board)
  end

  def render
      system("clear")
      puts "Arrow keys, WASD, or vim to move, space or enter to confirm."
      build_grid
      @cursor.get_input
  end

  def build_grid
    #row_puts = []
    @board.board.each_with_index do |row, row_idx|
      puts ""
      row.each_with_index do |piece, col_idx|
        color_options = colors_for(row_idx, col_idx)
        print piece.to_s.colorize(color_options)
      end
      #puts row_puts
    end
  end

  def colors_for(i, j)
    if [i, j] == cursor.cursor_pos && cursor.selected
      bg = :light_green
    elsif [i, j] == cursor.cursor_pos
      bg = :light_red
    elsif (i + j).odd?
      bg = :light_blue
    else
      bg = :light_yellow
    end
    { background: bg }
  end

end
