class FollowerFinder < MasterService
  
  def initialize(user)
    @user = user
    @url  = 'user/followers'
  end

  def followers
    JSON.parse(raw_response(@url, true), symbolize_names: true).map do |attrs|
      Follower.new(attrs)
    end
  end
end
