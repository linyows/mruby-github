class Github
  class Client
    DEFAULT_API_ENDPOINT = 'https://api.github.com'

    attr_writer :token
    attr_accessor :api_endpoint

    def initialize(endpoint = nil)
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
      key = Base64::encode("#{user}:#{password}")
      res = get('/user', { 'Authorization' => "Basic #{key}" })
      res.code == 200
    end

    def org_teams(org, options = {})
      get("/orgs/#{org}/teams")
    end

    def team(team_id, options = {})
      get("/teams/#{team_id}")
    end

    def team_member?(team_id, user, options = {})
      boolean_from_response get("teams/#{team_id}/members/#{user}", options)
    end

    def get(path, options = {})
      url = @api_endpoint + path
      @http.get(url, nil, DEFAULT_HEADERS.merge(options))
    end

    def boolean_from_respoonse(res)
      res.code == 204
    end
  end
end
