require 'router'

RSpec.describe WebDisplay::Router do
  it 'forwards calls to root' do
    callable = Callable.new
    mapping = { "/" => callable }
    router = WebDisplay::Router.new(mapping)
    router.call(request_for("/"))

    expect(callable).to be_called
  end

  it 'forwards calls to start' do
    callable = Callable.new
    mapping = { "/start" => callable }
    router = WebDisplay::Router.new(mapping)
    router.call(request_for("/start"))

    expect(callable).to be_called

  end

  it 'forwards calls to to controller matched by regex' do
    callable = Callable.new
    mapping = { "/game/{id}" => callable }
    router = WebDisplay::Router.new(mapping)
    router.call(request_for("/game/12"))

    expect(callable).to be_called
    expect(callable.param(:id)).to eq "12"
  end

  it 'forwards calls to to controller matched by extendend regex' do
    game_callable = Callable.new
    move_callable = Callable.new
    mapping = { "/game/{id}/move/{move}" => move_callable,
                "/game/{id}" => game_callable}
    router = WebDisplay::Router.new(mapping)

    router.call(request_for("/game/12/move/12345"))
    router.call(request_for("/game/765"))

    expect(move_callable).to be_called
    expect(move_callable.param(:id)).to eq "12"
    expect(move_callable.param(:move)).to eq "12345"

    expect(game_callable).to be_called
    expect(game_callable.param(:id)).to eq "765"
  end

  def request_for(path)
    { 'PATH_INFO' => path }
  end

  class Callable
    def call(env, params)
      @called = true
      @params = params
    end

    def called?
      @called
    end

    def param(name)
      @params[name]
    end
  end
end
