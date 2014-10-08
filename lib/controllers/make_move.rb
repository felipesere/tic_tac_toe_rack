module WebDisplay
  module Controllers
    class MakeMove
      def initialize(repo)
        @repo = repo
      end

      def call(req, params)
        id = params[:id].to_i
        game = repo.find(id)
        game.tick
        p game.current_board
        redirect_to("/game/#{id}")
      end

      private
      attr_reader :repo

      def redirect_to(path)
          [ 302, { 'Location' => path }, []]
      end
    end
  end
end
