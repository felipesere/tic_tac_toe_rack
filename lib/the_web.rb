require 'router'
require 'controllers/index'

module WebDisplay
  class TheWeb
    def initialize
      mapping = { '/' => Controllers::Index.new }
      @router = Router.new(mapping)
    end

    def call(env)
      @router.call(env)
    end
  end
end

