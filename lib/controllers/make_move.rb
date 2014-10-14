require 'controllers/base'

module WebDisplay
  module Controllers
    class MakeMove < BaseController
      def initialize(repo, web_io)
        @repo = repo
        @web_io = web_io
      end

      def call(req, id: id, move: move)
        web_io.set_next_move(move.to_i)
        game = repo.find(id.to_i)
        if !game.is_finished?
          game.tick
        end
        redirect_to("/game/#{id}")
      end

      private
      attr_reader :repo, :web_io
    end
  end
end
