require 'presenters/board_presenter'
require 'tic_tac_toe_core/board'
require 'tic_tac_toe_core/game'
require 'scriptable_player'

RSpec.describe WebDisplay::Presenter::BoardPresenter do
  let(:empty_board) { TicTacToeCore::Board.create_empty }

  it 'gives links for empty board' do
    presenter = WebDisplay::Presenter::BoardPresenter.new(1, empty_game)
    expect(presenter.rows.count).to eq 3
    expect(presenter.rows.first.map(&:link)).to eq ['/game/1/move/1',
                                                    '/game/1/move/2',
                                                    '/game/1/move/3']
  end

  it "can display a message" do
    presenter = WebDisplay::Presenter::BoardPresenter.new(1, empty_game, "the message")
    expect(presenter.has_message?).to be(true)
    expect(presenter.message).to eq "the message"
  end

  def empty_game
    TicTacToeCore::Game.new(ScriptablePlayer.new(:x), ScriptablePlayer.new(:o))
  end
end
