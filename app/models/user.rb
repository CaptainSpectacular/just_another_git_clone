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
    finder = RepositoryFinder.new(self)
    finder.repositories
  end

  def followers
    finder = FollowerFinder.new(self)
    finder.followers
  end
end
