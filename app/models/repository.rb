class Repository
  attr_reader :name, :url,:owner
  def initialize(repo)
    @name  = repo[:name]
    @url   = repo[:url]
    @owner = repo[:owner][:login]
  end

  def self.from_params(params)
    repo = { name: params[:repo],
             owner: { login: params[:user_slug] } }
    new(repo)
  end

  def commits
    finder = RepositoryFinder.new(@owner, @name)
    finder.commits
  end
end
