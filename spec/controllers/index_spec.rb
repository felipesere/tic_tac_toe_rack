require 'controllers/index'
require 'web_player_factory'

RSpec.describe WebDisplay::Controllers::Index do
  let(:factory) { WebDisplay::WebPlayerFactory.new(io: "sentinel")}
  let(:controller) { described_class.new(factory) }

  xit 'respond to call' do
    result = controller.call(nil,nil)
    expect(body(result)).to have_tag('form')
  end

  def body(response)
    response.last.first
  end
end
