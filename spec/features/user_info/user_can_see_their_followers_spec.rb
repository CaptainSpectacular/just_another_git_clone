require 'rails_helper'

describe 'a logged in user' do
  context 'visits their profile page' do
    scenario 'they can see their followers' do
      VCR.use_cassette('user_followers') do
        user = create(:user)
        allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

        visit profile_path

        user.followers.each do |follower|
          expect(page).to have_content(follower.username)
        end
      end
    end
  end
end
