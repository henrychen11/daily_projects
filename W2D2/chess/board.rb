
require_relative 'pieces.rb'
require_relative 'display.rb'

class Board
attr_accessor :board

  def initialize(board = Array.new(8) { Array.new(8) })
    @board = make_starting_grid(board)
  end

  def [](position)
    row , col = position
    @board[row][col]
  end

  def []=(position, value)
    row , col = position
    @board[row][col] = value
  end

  def move_piece(start_pos, end_pos)
    raise "Position not avaiable" if @board[start_pos] == NullPiece  || !end_pos.nil?
  end

  def make_starting_grid(board)
    board.each_with_index do |row, row_idx|
      row.each_with_index do |col, col_idx|

        fill_front_row(:black, board,row_idx, col_idx) if row_idx == 1
        fill_front_row(:white, board,row_idx, col_idx) if row_idx == 6

        fill_back_row(:black, board,row_idx, col_idx) if row_idx == 0
        fill_back_row(:white, board,row_idx, col_idx) if row_idx == 7

        board[row_idx][col_idx] = NullPiece.instance unless row_idx == 0 || row_idx == 1 || row_idx == 6 || row_idx == 7
      end
    end
    board
  end

  def valid_pos?(new_pos)
    if (new_pos[0] < 8 && new_pos[0] >= 0) && (new_pos[1] < 8 && new_pos[1] >= 0)
      return true
    else
      return false
    end
  end

  def fill_front_row(color, board, row_idx, col_idx)
    board[row_idx][col_idx] = Pawn.new(color, board,[row_idx, col_idx])
  end

  def fill_back_row(color, board, row_idx, col_idx)
    board[row_idx][col_idx] = Rook.new(color, board,[row_idx, col_idx]) if col_idx == 0 || col_idx == 7
    board[row_idx][col_idx] = Bishop.new(color, board,[row_idx, col_idx]) if col_idx == 2 || col_idx == 5
    board[row_idx][col_idx] = Knight.new(color, board,[row_idx, col_idx]) if col_idx == 1 || col_idx == 6
    board[row_idx][col_idx] = King.new(color, board,[row_idx, col_idx]) if col_idx == 4
    board[row_idx][col_idx] = Queen.new(color, board,[row_idx, col_idx]) if col_idx == 3
  end

end
