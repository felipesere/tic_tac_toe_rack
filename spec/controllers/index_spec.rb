require 'spec_helper'
require 'controllers/index'
require 'web_player_factory'

RSpec.describe WebDisplay::Controllers::Index do
  let(:factory) { WebDisplay::WebPlayerFactory.new(io: "sentinel")}
  let(:controller) { described_class.new(factory) }

  it 'renders lables for links ' do
    result = controller.call(nil,nil)
    expect(body(result)).to have_tag('form')
    expect(body(result)).to have_tag('label', with: { class: 'choice'})
    expect(body(result)).to have_tag('button', with: { class: 'play-button'})
  end

  def body(response)
    response.last.first
  end
end
