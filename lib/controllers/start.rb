require 'web_player_factory'
require 'tic_tac_toe_core/game'
require 'controllers/base'

module WebDisplay
  module Controllers
    class Start < BaseController

      def initialize(repo, factory)
        @repo = repo
        @factory = factory
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
        first,second = @factory.get_players(choice)
        game = TicTacToeCore::Game.new(first, second)
        repo.store(game)
      end

      def choice(input)
        input.split(/=/).last.to_i
      end

      private
      attr_reader :repo
    end
  end
end
