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
        respond(template('index.html.erb').result(bind))
      end

      def bind
        OpenStruct.new({game_types: factory.player_combinations}).instance_eval { binding }
      end

      private
      attr_reader :factory
    end
  end
end
