require 'tic_tac_toe_core/board'

module WebDisplay
  module Presenter
    class BoardPresenter

      def initialize(game_id, game, message = nil)
        @game_id = game_id
        @board   = game.current_board
        @game    = game
        @message = message
      end

      def rows
        board.elements.collect.each.with_index(1) do |cell, index|
          CellPresenter.new(@game_id, cell, index)
        end.each_slice(TicTacToeCore::Board::SIZE).to_a
      end

      def has_ended?
        game.is_finished?
      end

      def has_message?
        !@message.nil?
      end

      def message
        @message
      end


      private
      attr_reader :game_id, :board, :game
    end

    class CellPresenter
      attr_reader :game_id, :mark, :move
      def initialize(game_id, mark, move)
        @game_id = game_id
        @mark = mark
        @move  = move
      end

      def print
        if mark.nil?
         "<a href=\"#{link}\">#{move}</a></br>"
        else
          mark
        end
      end

      def link
        "/game/#{game_id}/move/#{move}"
      end
    end
  end
end
