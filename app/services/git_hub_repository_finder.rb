class GitHubRepositoryFinder < MasterService

  def initialize(username)
    @username = username
    @url      = "/users/#{username}/repos"
  end

  def repositories
    JSON.parse(raw_response(@url), symbolize_names:true).map do |attrs|
      Repository.new(attrs)
    end
  end
end
