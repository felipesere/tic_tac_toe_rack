require 'tic_tac_toe_core/game'
require 'controllers/make_move'
require 'game_repository'
require 'scriptable_player'
require 'fake_request'

RSpec.describe WebDisplay::Controllers::MakeMove do
  it 'applies a move to a game' do
    repo = WebDisplay::GameRepository.new
    game = TicTacToeCore::Game.new(player(:x, 4), player(:o, 5))
    id = repo.store(game)
    controller = WebDisplay::Controllers::MakeMove.new(repo)
    controller.call(request, id: id, move: 1)
    expect(game.current_board.possible_moves.count).to eq 8
  end

  def player(name, *moves)
    ScriptablePlayer.new(name, *moves)
  end

  def request
    FakeRequest.new
  end
end
