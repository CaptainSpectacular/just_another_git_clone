require 'rails_helper'

describe 'a user' do
  before(:each) do
    @user = create(:user)
  allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)
  end

  context 'visits their profile page' do
    scenario 'they can see their repositories' do
      VCR.use_cassette('user_repositories') do
        visit profile_path 
      
        @user.repositories.each do |repo|
          expect(page).to have_content(repo.name) 
        end
      end
    end
  end
end
