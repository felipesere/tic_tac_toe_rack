#! /usr/bin/env ruby

$LOAD_PATH.unshift File.dirname(__FILE__) + '/../lib'

require 'rack'
require 'sprockets'
require 'sass'
require 'the_web'

module WebDisplay
  app = Rack::Builder.new do
    map "/assets" do
      environment = Sprockets::Environment.new
      environment.append_path 'lib/assets/css'
      run environment
    end

    main =  TheWeb.new
    map "/" do
      run main
    end
  end
  Rack::Handler::WEBrick.run app
end
