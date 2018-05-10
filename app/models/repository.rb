class Repository
  attr_reader :name, :url
  def initialize(repo)
    @name = repo[:name]
    @url  = repo[:url]
    @owner = repo[:owner][:login]
  end
  
  def commits
    conn = Faraday.new('https://api.github.com')
    raw_r = conn.get("/repos/#{@owner}/#{@name}/commits").body
    JSON.parse(raw_r, symbolize_names: true).map do |attrs|
      Commit.new(attrs)
    end
  end
end
