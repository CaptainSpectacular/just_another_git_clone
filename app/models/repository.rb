class Repository
  attr_reader :name, :url
  def initialize(repo)
    @name  = repo[:name]
    @url   = repo[:url]
    @owner = repo[:owner][:login]
  end

  def self.from_params(params)
    new(name: params[:repo], owner: { login: params[:user_slug] } )
  end

  def commits
    finder = RepositoryFinder.new(@owner, @name)
    finder.commits
  end
end
