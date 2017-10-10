
require_relative 'piece.rb'
require_relative 'NullPiece.rb'



class Board
attr_accessor :board

  def initialize(board = Array.new(8) { Array.new(8) })
    @board = board
    @board.each_with_index do |row, row_idx|
      row.each_with_index do |col, col_idx|
        self[[row_idx, col_idx]] = NullPiece.new unless row_idx == 0 || row_idx == 1 || row_idx == 6 || row_idx == 7
        self[[row_idx, col_idx]] = Piece.new if row_idx == 0 || row_idx == 1 || row_idx == 6 || row_idx == 7
      end
    end
    @board
  end

  def [](position)
    row , col = position
    @board[row][col]
  end

  def []=(position, value)
    row , col = position
    @board[row][col] = value
  end

  def make_starting_grid()
  end

  def checkmate?()
    return false
    true
  end

  def find_king(king)
  end
  

  def move_piece(start_pos, end_pos)
    raise "Position not avaiable" if start_pos.nil? || !end_pos.nil?
  end
end
