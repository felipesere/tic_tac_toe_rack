require 'controllers/start'
require 'game_repository'
require 'ostruct'

RSpec.describe WebDisplay::Controllers::Start do
  let(:repo) { WebDisplay::GameRepository.new }
  let(:controller) { described_class.new(repo)}

  it 'creates a new game in the repo' do
    controller.call(request("choice=1"), {})
    expect(repo.count).to eq 1
  end

  it 'results in a redirect' do
    response = controller.call(request("choice=1"), {})
    expect(redirect(response)).to eq "/game/2"
  end

  def redirect(response)
    response[1]['Location']
  end

  def request(content)
    OpenStruct.new(post?: true, body: body(content))
  end

  def body(content)
    OpenStruct.new(read: content)
  end
end
