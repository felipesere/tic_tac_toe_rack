require 'web_io'
require 'tic_tac_toe_core/game'
require 'controllers/make_move'
require 'game_repository'
require 'scriptable_player'
require 'fake_request'

RSpec.describe WebDisplay::Controllers::MakeMove do
  let(:web_io) { WebDisplay::WebIO.new }
  let(:repo) { WebDisplay::GameRepository.new }
  let(:controller)  {WebDisplay::Controllers::MakeMove.new(repo, web_io) }

  it 'applies a move to a game' do
    game = TicTacToeCore::Game.new(player(:x, 4), player(:o, 5))
    id = repo.store(game)
    controller.call(request, id: id, move: 1)
    expect(game.current_board.possible_moves.count).to eq 8
  end

  it 'does not make a move if game is finsihed' do
    game = double("game")
    allow(game).to receive(:is_finished?) { true }
    id = repo.store(game)
    controller.call(request, id: id, move: 1)
  end

  def player(name, *moves)
    ScriptablePlayer.new(name, *moves)
  end


  def request
    FakeRequest.new
  end
end
