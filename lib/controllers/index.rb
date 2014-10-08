require 'erb'
require 'ostruct'
require 'web_player_factory'

module WebDisplay
  module Controllers
    class Index
      def initialize
        @template = ERB.new(File.read("lib/views/index.html.erb"));
        @factory = WebPlayerFactory.new
      end
      def call(env, param)
        [ 200, {'Content-Type' => 'text/html'}, [ template.result(bind) ] ]
      end

      def bind
        OpenStruct.new({game_types: factory.player_combinations}).instance_eval { binding }
      end

      private
      attr_reader :template, :factory
    end
  end
end
