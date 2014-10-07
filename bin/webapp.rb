#! /usr/bin/env ruby

$LOAD_PATH.unshift File.dirname(__FILE__) + '/../lib'

require 'rack'
require 'the_web'

module WebDisplay
  app = Rack::Builder.app do
    run TheWeb.new
  end
  Rack::Handler::WEBrick.run app
end
