require 'presenters/board_presenter'
require 'tic_tac_toe_core/players/human_player'

module WebDisplay
  module Controllers
    class ViewBoard
      def initialize(repo)
        @template = ERB.new(File.read("lib/views/board.html.erb"));
        @repo = repo
      end

      def call(req, params)
        id = params[:id]
        game = load_game(id)
        response = render(id, game.current_board)
        if ai_is_next(game)
          response[1]['Refresh'] = "2; url=/game/#{id}/move/-1"
        end
        response
      end

      def load_game(id)
        repo.find(id.to_i)
      end

      def render(id, board)
        presenter = Presenter::BoardPresenter.new(id, board)
        [ 200, {'Content-Type' => 'text/html'}, [template.result(presenter.bind)] ]
      end

      def ai_is_next(game)
       !game.players.first.instance_of? TicTacToeCore::Players::HumanPlayer
      end

      private
      attr_reader :repo, :template
    end
  end
end
