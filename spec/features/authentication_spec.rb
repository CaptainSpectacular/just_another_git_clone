require 'rails_helper'
require 'support/omniauth.rb'

describe 'authentication' do
  it 'can use github' do
    visit root_path 
    click_link 'Sign in with GitHub'

    expect(current_path).to eq(root_path)
    expect(page).to have_content('BurbotsRevenge')
 end
end
