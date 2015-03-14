require 'controllers/start'
require 'game_repository'
require 'fake_request'
require 'web_player_factory'

RSpec.describe WebDisplay::Controllers::Start do
  let(:factory) {WebDisplay::WebPlayerFactory.new(io: "sentinel")}
  let(:repo) { WebDisplay::GameRepository.new }
  let(:controller) { described_class.new(repo, factory)}

  it 'results in a redirect' do
    response = controller.call(request("choice=1"), {})
    expect(repo.count).to eq 1
    expect(redirect(response)).to eq "/game/1"
  end

  def redirect(response)
    response[1]['Location']
  end

  def request(content)
    FakeRequest.new(:post, content)
  end
end
