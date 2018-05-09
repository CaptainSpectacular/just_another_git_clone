class Repository
  attr_reader :name, :url
  def initialize(repo)
    @name = repo[:name]
    @url  = repo[:url]
  end
end
