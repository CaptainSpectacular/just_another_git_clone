class RepositoryFinder < MasterService
  
  def initialize(user)
    @user = user
    @url = "/users/#{user.username}/repos"
  end

  def repositories
    JSON.parse(raw_response(@url, true), symbolize_names: true).map do |attrs|
      Repository.new(attrs)
    end
  end
end
