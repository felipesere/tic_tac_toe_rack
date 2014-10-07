require 'erb'
require 'ostruct'
require 'tic_tac_toe_core/players/player_types'

module WebDisplay
  module Controllers
    class Index
      def initialize
        @template = ERB.new(File.read("lib/views/index.html.erb"));
      end
      def call(env, param)
        [ 200, {'Content-Type' => 'text/html'}, [ @template.result(bind) ] ]
      end

      def bind
        OpenStruct.new({game_types: TicTacToeCore::Players::PlayerTypes.player_combinations}).instance_eval { binding }
      end
    end
  end
end
