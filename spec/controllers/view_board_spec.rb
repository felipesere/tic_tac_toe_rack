require 'controllers/view_board'
require 'game_repository'

RSpec.describe WebDisplay::Controllers::ViewBoard do
 it 'can load the game by id' do
    repo = WebDisplay::GameRepository.new
    id = repo.store("sentinel")
    controller = described_class.new(repo)
    expect(controller.load_game(id)).to eq "sentinel"
 end
end
