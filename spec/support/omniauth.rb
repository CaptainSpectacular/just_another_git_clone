OmniAuth.config.test_mode = true
omniauth_hash = { 'provider' => 'github',
                  'uid'      => '11223',
                  'info'     => {
                    'name'     => 'Burbot',
                    'email'    => 'burbot@swampsong.com',
                    'nickname' => 'BurbotsRevenge' }}
  
OmniAuth.config.add_mock(:github, omniauth_hash)
