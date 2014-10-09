require 'tilt'

module WebDisplay
  module Controllers
    class BaseController
      def initialize
        @template_dir = 'lib/views'
      end

      def redirect_to(path)
          [ 302, { 'Location' => path }, []]
      end

      def template(name)
       Tilt::ERBTemplate.new("lib/views/#{name}")
      end

      def respond(body)
        [ 200, {'Content-Type' => 'text/html'}, [body] ]
      end
    end
  end
end
