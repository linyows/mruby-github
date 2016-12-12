class Github
  class Client
    DEFAULT_API_ENDPOINT = 'https://api.github.com'

    attr_writer :token
    attr_reader :last_response
    attr_accessor :api_endpoint

    def initialize(endpoint = nil)
      @last_response = nil
      @http = HttpRequest.new
      @api_endpoint = endpoint || DEFAULT_API_ENDPOINT
    end

    def default_headers
      {
        'User-Agent' => 'mruby github client',
        'Authorization' => "token #{token}"
      }
    end

    def token
      @token ||= ENV['GITHUB_TOKEN']
    end

    def basic_authenticated?(user, password)
      get('/user', {
        "Authorization" => "Basic #{Base64::encode("#{user}:#{password}")}"
      })
      @last_response.code == 200
    end

    def org_teams(org, options = {})
      get("/orgs/#{org}/teams")
    end

    def team(team_id, options = {})
      get("/teams/#{team_id}")
    end

    def team_member?(team_id, user, options = {})
      boolean_from_response(:get, "/teams/#{team_id}/members/#{user}", nil, options)
    end

    def get(path, options = {})
      request(:get, path, nil, options)
    end

    def post(path, data, options = {})
      request(:post, path, data, options)
    end

    def put(path, data, options = {})
      request(:put, path, data, options)
    end

    def request(method, path, data, options = {})
      url = @api_endpoint + path
      @last_response = res = @http.send(method, url, data, default_headers.merge(options))
      JSON::parse(res.body) unless res.body.empty?
    end

    def boolean_from_response(method, path, data, options = {})
      request(method, path, data, options)
      @last_response.code == 204
    end
  end
end
