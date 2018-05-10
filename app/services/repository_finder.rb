class RepositoryFinder

  def initialize(owner, repo)
    @repo  = repo
    @owner = owner 
  end
  
  def commits 
    JSON.parse(raw_response, symbolize_names: true).map do |attrs|
      Commit.new(attrs)
    end
  end

  private

  def conn
    Faraday.new('https://api.github.com')
  end

  def raw_response
    conn.get("/repos/#{@owner}/#{@repo}/commits").body
  end
end
