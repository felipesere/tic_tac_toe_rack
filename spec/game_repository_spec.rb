require 'game_repository'

RSpec.describe WebDisplay::GameRepository do
  it 'can store a game and return an id' do
    repo = WebDisplay::GameRepository.new
    id = repo.store("wat")
    expect(id).to be > 0
  end

  it 'can retrieve by id' do
    repo = WebDisplay::GameRepository.new
    id = repo.store("wat")
    expect(repo.find(id)).to eq "wat"
  end

  it 'it can delete by id' do
    repo = WebDisplay::GameRepository.new
    id = repo.store("wat")
    expect(repo.find(id)).to eq "wat"
    repo.delete(id)
    expect(repo.find(id)).to eq nil
  end
end
