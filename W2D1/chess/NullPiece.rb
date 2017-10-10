
class NullPiece < Piece
  def initialize(king, knight, pawn, bishop, queen, rook)
    @king = king
    @knight = knight
    @pawn = pawn
    @bishop = bishop
    @queen = queen
    @rook = rook
  end

  def moves()
  end

end
