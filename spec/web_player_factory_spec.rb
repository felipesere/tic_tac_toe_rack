require 'tic_tac_toe_core/players/human_player'
require 'web_player_factory'

RSpec.describe WebDisplay::WebPlayerFactory do
  let(:factory) { WebDisplay::WebPlayerFactory.new(io: "sentinel") }

  it 'provides player combinations as number array' do
    player_combinations = factory.player_combinations
    expect(player_combinations.keys).to eq [0,1,2,3,4,5,6,7,8]
    expect(player_combinations[0]).to eq "human vs. computer"
  end

  it 'converts the chosen number to actual players' do
    players = factory.get_players(0)
    expect(players.first).to be_a TicTacToeCore::Players::HumanPlayer
    expect(players.last).to be_a TicTacToeCore::Players::FastAiPlayer
  end
end
