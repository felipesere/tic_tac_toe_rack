require 'router'
require 'controllers/index'
require 'controllers/start'
require 'controllers/view_board'
require 'game_repository'

module WebDisplay
  class TheWeb
    def initialize
      repo = GameRepository.new
      mapping = { '/'      => Controllers::Index.new,
                  '/start' => Controllers::Start.new(repo),
                  '/game/{id}' => Controllers::ViewBoard.new(repo)}
      @router = Router.new(mapping)
    end

    def call(env)
      @router.call(env)
    end
  end
end

