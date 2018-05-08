class User < ApplicationRecord
  validates_presence_of :username
 
  def self.from_omniauth(auth)
    where(uid: auth[:uid]).first_or_create do |user|
      user.uid      = auth.uid
      user.username = auth.info.nickname
    end
  end
end
