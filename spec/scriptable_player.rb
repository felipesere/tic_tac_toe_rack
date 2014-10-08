class ScriptablePlayer
  attr_reader :name, :moves

  def initialize(name, *moves)
    @name  = name
    @moves = moves
  end

  def perform_move(board)
    board.possible_moves
    move = moves.shift
    board.perform_move(name, move)
  end
end
