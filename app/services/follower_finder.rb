class FollowerFinder
  
  def initialize(user)
    @user = user
  end

  def followers
    JSON.parse(raw_response.body, symbolize_names: true).map do |attrs|
      Follower.new(attrs)
    end
  end
  
  private

  def conn
    Faraday.new('https://api.github.com') 
  end

  def raw_response
    conn.get do |req|
      req.url "user/followers"
      req.headers['Authorization'] = 'token ' + @user.token
    end
  end
end
