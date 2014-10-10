require 'controllers/base'

module WebDisplay
  module Controllers
    class MakeMove < BaseController
      def initialize(repo, web_io)
        @repo = repo
        @web_io = web_io
      end

      def call(req, params)
        id = params[:id].to_i
        move = params[:move].to_i
        web_io.set(move)
        game = repo.find(id)
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
