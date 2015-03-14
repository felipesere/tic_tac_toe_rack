require 'router'
require 'web_io'
require 'controllers/index'
require 'controllers/start'
require 'controllers/view_board'
require 'controllers/make_move'
require 'game_repository'

module WebDisplay
  class Dispatcher
    def initialize

      repo = GameRepository.new
      web_io = WebIO.new
      factory = WebPlayerFactory.new(io: web_io)

      mapping = { '/'      => Controllers::Index.new(factory),
                  '/start' => Controllers::Start.new(repo, factory),
                  '/game/{id}' => Controllers::ViewBoard.new(repo),
                  '/game/{id}/move/{move}' => Controllers::MakeMove.new(repo,web_io)}

      @router = Router.new(mapping)
    end

    def call(env)
      @router.call(env)
    end
  end
end

