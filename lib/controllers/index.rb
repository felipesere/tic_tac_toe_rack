require 'erb'
require 'ostruct'
require 'web_player_factory'
require 'controllers/base'

module WebDisplay
  module Controllers
    class Index < BaseController
      def initialize(factory)
        @factory = factory
      end

      def call(env, param)
        respond('index.html.erb', game_types: factory.player_combinations)
      end

      private
      attr_reader :factory
    end
  end
end
