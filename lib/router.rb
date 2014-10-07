module WebDisplay
  class Router
    def initialize(mapping)
      @mapping = mapping
    end

    def call(env)
      path = env['PATH_INFO']
      match = @mapping.find { |regex, _|  path_match(regex, path) }
      params = extract_variables(path, match.first)
      match.last.call(env, {})
    end

    def path_match(regex, path)
      temp = (path =~ build(regex))
      temp == 0
    end

    def build(regex)
      Regexp.new('\A' + replace_variables(regex) + '\Z')
    end

    def replace_variables(regex)
      regex.gsub(/{[^}]+}/, "([^/]+)")
    end

    def extract_variables(input, regex)
      proper_regex = build(regex)
      matchData = input.match(regex.to_s)
      {}
    end
  end
end
