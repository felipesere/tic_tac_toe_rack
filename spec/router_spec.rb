require 'router'

RSpec.describe WebDisplay::Router do
  it 'forwards calls to root' do
    counter = 0
    mapping = { '/' => -> (env, params) { counter += 1 } }
    router = WebDisplay::Router.new(mapping)
    router.call(request_for('/'))
    expect(counter).to eq 1
  end

  it 'forwards calls to start' do
    counter = 0
    mapping = { '/start' => -> (env, params) { counter += 1 } }
    router = WebDisplay::Router.new(mapping)
    router.call(request_for('/start'))
    expect(counter).to eq 1
  end

  it 'forwards calls to to controller matched by regex' do
    counter = 0
    mapping = { '/game/{id}' => -> (env, params) { counter += 1 } }
    router = WebDisplay::Router.new(mapping)
    router.call(request_for('/game/12'))
    expect(counter).to eq 1
  end

  it 'forwards calls to to controller matched by extendend regex' do
    counter = 0
    mapping = { '/game/{id}/move/{move}' => -> (env, params) { counter += 1 } }
    router = WebDisplay::Router.new(mapping)
    router.call(request_for('/game/12/move/12345'))
    expect(counter).to eq 1
  end

  def request_for(path)
    { 'PATH_INFO' => path }
  end
end
