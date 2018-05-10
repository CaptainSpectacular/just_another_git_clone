class GitHubUser
  attr_reader :username

  def initialize(username)
    @username = username
  end

   def repositories
     processed_response.map do |repo|
       Repository.new(repo)
     end
   end
 
   def followers
     finder = FollowerFinder.new(self)
     finder.followers
   end
 
   private
 
   def conn
     Faraday.new('https://api.github.com')
   end
 
   def response
     conn.get do |req|
       req.url "/users/#{@username}/repos"
     end
   end
 
   def processed_response
     JSON.parse(response.body, symbolize_names: true)
   end
end
