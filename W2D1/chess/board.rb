
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
    raise 'invalid pos' unless valid_pos?(pos)

    row , col = position
    @board[row][col]
  end

  def []=(position, value)
    raise 'invalid pos' unless valid_pos?(pos)

    row , col = position
    @board[row][col] = value
  end

  def add_piece(piece, pos)
    raise 'position not empty' unless empty?(pos)

    self[pos] = piece
  end

  def make_starting_grid()
  end

  def valid_pos?(pos)
    pos.all? { |coord| coord.between?(0, 7) }
  end

  def checkmate?(color)
    return false unless in_check?(color)

    pieces.select { |p| p.color == color }.all? do |piece|
      piece.valid_moves.empty?
    end
  end

  def find_king(king)
  end


  def move_piece(start_pos, end_pos)
    raise "Position not avaiable" if start_pos.nil? || !end_pos.nil?
  end

  def empty?(pos)
    self[pos].empty?
  end
end
