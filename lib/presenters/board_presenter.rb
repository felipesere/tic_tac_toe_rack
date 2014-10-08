module WebDisplay
  module Presenter
    class BoardPresenter
      def initialize(game_id, board)
        @game_id = game_id
        @board   = board
      end

      def rows
        board.elements.collect.each.with_index(1) do |cell, index|
          link(index)
        end.each_slice(TicTacToeCore::Board::SIZE).to_a
      end

      def link(move)
        "/game/#{game_id}/move/#{move}"
      end

      def bind
        binding
      end

      private
      attr_reader :game_id, :board
    end
  end
end
