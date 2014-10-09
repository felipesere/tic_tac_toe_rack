module WebDisplay
  module Presenter
    class BoardPresenter
      def initialize(game_id, game)
        @game_id = game_id
        @board   = game.current_board
        @game    = game
      end

      def rows
        board.elements.collect.each.with_index(1) do |cell, index|
          CellPresenter.new(@game_id, cell, index)
        end.each_slice(TicTacToeCore::Board::SIZE).to_a
      end

      def has_ended?
        game.is_finished?
      end

      def bind
        binding
      end

      private
      attr_reader :game_id, :board, :game
    end

    class CellPresenter
      def initialize(game_id, value, move)
        @game_id = game_id
        @value = value
        @move  = move
      end

      def print
        if @value.nil?
         "<a href=\"#{link}\">#{@move}</a></br>"
        else
          @value
        end
      end

      def link
        "/game/#{@game_id}/move/#{@move}"
      end
    end
  end
end
