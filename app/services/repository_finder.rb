class RepositoryFinder

  def initialize(username, repo)
    @repo = repo
    @username = username
  end

  def commits 
    conn = Faraday.new('https://api.github.com')
    raw_r = conn.get("/repos/#{@username}/#{@repo}/commits").body
    JSON.parse(raw_r, symbolize_names: true).map do |attrs|
      Commit.new(attrs)
    end
  end
end
