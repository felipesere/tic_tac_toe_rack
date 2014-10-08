require 'controllers/index'

RSpec.describe WebDisplay::Controllers::Index do
  let(:controller) { described_class.new }
  it 'respond to call' do
    result = controller.call(nil,nil)
    expect(body(result)).to have_tag('form')
  end

  def body(response)
    response.last.first
  end
end
