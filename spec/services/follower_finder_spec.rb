require 'rails_helper'

describe FollowerFinder do
  subject{ FollowerFinder.new(create(:user)) }

  describe 'creation' do
    it 'can be made' do
      expect(subject).to be_a(FollowerFinder)
    end
  end

  describe 'instance methods' do
    it '#followers' do
      VCR.use_cassette('user_followers') do
        expect(subject.followers.first).to be_a(Follower)
      end
    end
  end
end
