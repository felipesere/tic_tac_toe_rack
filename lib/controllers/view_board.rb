require 'controllers/base'
require 'presenters/board_presenter'
require 'tic_tac_toe_core/players/human_player'

module WebDisplay
  module Controllers
    class ViewBoard < BaseController
      def initialize(repo)
        @repo = repo
      end

      def call(req, id: id)
        game = load_game(id)
        response = respond('board.html.erb', context: presenter(id, game))
        if should_refresh(game)
          response[1]['Refresh'] = "1; url=/game/#{id}/move/-1"
        end
        response
      end

      def should_refresh(game)
        game.is_computers_turn? && !game.is_finished?
      end

      def load_game(id)
        repo.find(id.to_i)
      end

      def presenter(id, game)
        message = get_message_for(game)
        presenter = Presenter::BoardPresenter.new(id, game, message)
      end

      def get_message_for(game)
        if game.is_finished?
          board = game.current_board
          if board.has_draw?
            "There was a draw!"
          else
            "The Winner is #{board.winner}"
          end
        end
      end

      private
      attr_reader :repo
    end
  end
end
