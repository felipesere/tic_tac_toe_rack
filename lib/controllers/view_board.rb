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
        response = render(id, game)
        if game.is_computers_turn? && !game.is_finished?
          response[1]['Refresh'] = "2; url=/game/#{id}/move/-1"
        end
        response
      end

      def load_game(id)
        repo.find(id.to_i)
      end

      def render(id, game)
        presenter = Presenter::BoardPresenter.new(id, game)
        respond(template('board.html.erb').render(presenter))
      end

      private
      attr_reader :repo
    end
  end
end
