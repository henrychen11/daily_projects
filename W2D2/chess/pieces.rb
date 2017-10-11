require 'singleton'
require_relative 'piece'
# require_relative 'slideable'

class NullPiece < Piece
  attr_reader :symbol
  include Singleton

  def initialize
    @symbol = " "
    @color = :none
  end

  def moves
    []
  end

end

class Pawn < Piece
  def symbol
    '♟'.colorize(color)
  end
end

class Queen < Piece
  # include Slideable

  def symbol
    '♛'.colorize(color)
  end

  protected

  def move_dirs
    horizontal_dirs + diagonal_dirs
  end
end

class Rook < Piece
  # include Slideable

  def symbol
    '♜'.colorize(color)
  end

  protected

  def move_dirs
    horizontal_dirs
  end
end


class Bishop < Piece
# include Slideable
  def symbol
    '♝'.colorize(color)
  end

  protected

  def move_dirs
    diagonal_dirs
  end

end

class Knight < Piece
  # include Stepable

  def symbol
    '♞'.colorize(color)
  end

  protected

  def move_diffs
    [[-2, -1],
     [-1, -2],
     [-2, 1],
     [-1, 2],
     [1, -2],
     [2, -1],
     [1, 2],
     [2, 1]]
  end
end

class King < Piece
  # include Stepable
  def symbol
    '♚'.colorize(color)
  end

  protected

  def move_diffs
    [[-1, -1],
     [-1, 0],
     [-1, 1],
     [0, -1],
     [0, 1],
     [1, -1],
     [1, 0],
     [1, 1]]
  end

end
