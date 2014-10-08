require 'uri'
require 'web_player_factory'
require 'tic_tac_toe_core/game'

module WebDisplay
  module Controllers
    class Start

      def initialize(the_repo)
        @repo = the_repo
        @factory = WebPlayerFactory.new
      end

      def call(request, params)
        if request.post?
          id = create_game(choice(request.body.read))
          redirect_to("/game/#{id}")
        else
          redirect_to("/")
        end
      end

      def create_game(choice)
        players = @factory.get_players(choice)
        game = TicTacToeCore::Game.new(*players)
        repo.store(game)
      end

      def redirect_to(path)
          [ 302, { 'Location' => path }, []]
      end

      def choice(input)
        decode(input).split(/=/).last.to_i
      end

      def decode(input)
        input
      end

      private
      attr_reader :repo
    end
  end
end
