require 'rails_helper'

describe 'authentication' do
  it 'can use github' do
    OmniAuth.config.test_mode = true
    omniauth_hash = { 'provider' => 'github',
                      'uid' => '11223',
                      'info' => {
                          'name' => 'Burbot',
                          'email' => 'burbot@swampsong.com',
                          'nickname' => 'BurbotsRevenge' }}
 
    OmniAuth.config.add_mock(:github, omniauth_hash)
    visit root_path 
    click_link 'Sign in with GitHub'

    expect(current_path).to eq(root_path)
    expect(page).to have_content('BurbotsRevenge')
 end
end
