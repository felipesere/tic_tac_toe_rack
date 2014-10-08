require 'presenters/board_presenter'

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
        render(id, game.current_board)
      end

      def load_game(id)
        repo.find(id.to_i)
      end

      def render(id, board)
        presenter = Presenter::BoardPresenter.new(id, board)
        [ 200, {'Content-Type' => 'text/html'}, [template.result(presenter.bind)] ]
      end

      private
      attr_reader :repo, :template
    end
  end
end
