require 'rails_helper'

describe 'a logged in user' do
  context 'visits a repo show' do
    before(:each) do
      @user = create(:user)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)
    end

    scenario 'they see a list of commits for that repo' do
      VCR.use_cassette('repo_commits') do
        repo = @user.repositories.last
        visit "/users/#{@user.username}/repos/#{repo.name}"

        expect(page).to have_css('.commit', count: 30)

        repo.commits.each do |commit|
          expect(page).to have_content(commit.author)
          expect(page).to have_content(commit.author_url)
          expect(page).to have_content(commit.date)
        end 
      end
    end
  end
end
