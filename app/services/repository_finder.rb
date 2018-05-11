class RepositoryFinder < MasterService

  def initialize(owner, repo)
    @repo  = repo
    @owner = owner 
    @url   = "/repos/#{owner}/#{repo}/commits"
  end
  
  def commits 
    JSON.parse(raw_response(@url), symbolize_names: true).map do |attrs|
      Commit.new(attrs)
    end
  end
end
