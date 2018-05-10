class User < ApplicationRecord
  validates_presence_of :username
 
  def to_param
    username
  end

  def self.from_omniauth(auth)
    where(uid: auth[:uid]).first_or_create do |user|
      user.uid      = auth.uid
      user.username = auth.info.nickname
      user.token    = auth.credentials.token
    end
  end

  def repositories 
    processed_response.map do |repo|
      Repository.new(repo)
    end
  end

  private

  def conn
    Faraday.new('https://api.github.com')
  end

  def response
    conn.get do |req|
      req.url "/users/#{username}/repos"
      req.headers['Authorization'] = 'token ' + token
    end
  end

  def processed_response
    JSON.parse(response.body, symbolize_names: true)
  end
end
