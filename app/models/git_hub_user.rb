class GitHubUser
  attr_reader :username

  def initialize(username)
    @username = username
  end

  def repositories
    finder = GitHubRepositoryFinder.new(@username)
    finder.repositories
  end
end
