require 'scriptable_player'
require 'tic_tac_toe_core/game'
require 'controllers/view_board'
require 'game_repository'
require 'fake_request'

RSpec.describe WebDisplay::Controllers::ViewBoard do
 let(:repo) { WebDisplay::GameRepository.new }
 let(:controller) { described_class.new(repo)}

 it 'can load the game by id' do
    id = repo.store("sentinel")
    expect(controller.load_game(id)).to eq "sentinel"
 end

 it 'shows a "finish" button when the there are no more moves left' do
    game = finsihed_game
    id = repo.store(game)
    request = FakeRequest.new
    response = controller.call(request, id: id)
    expect(response.last.first).to include "End"
    expect(response[1]).not_to include 'Refresh'
 end

 def finsihed_game
   first  = ScriptablePlayer.new(:x, 1, 3, 4, 5, 8)
   second = ScriptablePlayer.new(:o, 2, 9, 6, 7)
   game = TicTacToeCore::Game.new(first, second)
   while(!game.is_finished?)
     game.tick
   end
   game
 end
end
