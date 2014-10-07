module WebDisplay
  class Router
    def initialize(mapping)
      @mapping = mapping
    end

    def call(env)
      path = env['PATH_INFO']
      match = @mapping.find { |regex, _|  path_match(regex, path) }
      if match
        params = extract_variables(path, match.first)
        match.last.call(env, params)
      else
        not_found
      end
    end

    def not_found
     [ 404, {'Content-Type' => 'text/plain'}, ["Not Found"]]
    end

    def path_match(regex, path)
      !!(path =~ build(regex))
    end

    def build(regex)
      Regexp.new("\\A#{replace_variables(regex)}\\Z")
    end

    def replace_variables(regex)
      # convert '/abc/{id}' to '/abc/(?<id>[^/]+)'
      regex.gsub(/{/, "(?<").gsub(/}/, ">[^/]+)")
    end

    def extract_variables(input, regex)
      input.match(build(regex))
    end
  end
end
