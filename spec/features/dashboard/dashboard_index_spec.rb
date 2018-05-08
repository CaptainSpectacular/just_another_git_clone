require 'rails_helper'

describe 'visiting the dashboard index' do
  context 'as a visitor' do
    scenario 'can see navbar' do
      visit dashboard_path
  
      expect(page).to have_link('Sign in with GitHub')
    end

    scenario 'can see all users' do
      u1, u2 = create_list(:user, 2)
      visit dashboard_path

      expect(page).to have_content(u1.username)
      expect(page).to have_content(u2.username)
    end
  end
end
