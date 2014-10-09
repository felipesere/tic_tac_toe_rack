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
        @template = ERB.new(File.read("lib/views/#{name}"));
      end

      def respond(body)
        [ 200, {'Content-Type' => 'text/html'}, [body] ]
      end
    end
  end
end
