module WebDisplay
  class TheWeb
    def call(env)

      template = ERB.new(File.read("lib/views/index.html.erb"));

      [ 200, {'Content-Type' => 'text/html'}, [template.result(binding)] ]
    end
  end
end

