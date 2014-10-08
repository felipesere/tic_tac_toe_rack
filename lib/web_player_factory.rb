require 'tic_tac_toe_core/players/player_types'
require 'tic_tac_toe_core/players/player_factory'

module WebDisplay
  class WebPlayerFactory
    def initialize
      @original = TicTacToeCore::Players::PlayerTypes.player_combinations
      @factory  = TicTacToeCore::Players::PlayerFactory.new(io: "sentinel")
    end

    def player_combinations
      result = {}
      original.each_with_index do |element, index|
        result[index] = printable(element)
      end
      result
    end

    def printable(element)
      "#{element.first.to_s} vs. #{element.last.to_s}"
    end

    def get_players(choice)
      factory.players(original[choice])
    end

    private
    attr_reader :original, :factory
  end
end
