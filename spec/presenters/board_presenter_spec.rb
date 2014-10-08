require 'presenters/board_presenter'
require 'tic_tac_toe_core/board'

RSpec.describe WebDisplay::Presenter::BoardPresenter do
  let(:empty_board) { TicTacToeCore::Board.create_empty }
  it 'gives links for empty board' do
    presenter = WebDisplay::Presenter::BoardPresenter.new(1, empty_board)
    expect(presenter.rows.count).to eq 3
    expect(presenter.rows.first).to eq ['/game/1/move/1', '/game/1/move/2','/game/1/move/3']
  end
end
