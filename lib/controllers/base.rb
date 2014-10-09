require 'tilt'

module WebDisplay
  module Controllers
    class BaseController
      def redirect_to(path)
          [ 302, { 'Location' => path }, []]
      end

      def template(name)
       Tilt::ERBTemplate.new("lib/views/#{name}")
      end

      def render(name, params = {} )
        context = params[:context] || Object.new
        layout.render(Object.new, params) do
          template(name).render(context, params)
        end
      end

      def respond(body)
        [ 200, {'Content-Type' => 'text/html'}, [body] ]
      end

      def layout
        Tilt::ERBTemplate.new("lib/views/layout.html.erb")
      end
    end
  end
end
