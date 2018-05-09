OmniAuth.config.test_mode = true
omniauth_hash = { 'provider'    => 'github',
                  'uid'         => '11223',
                  'info'        => {
                    'name'        => 'Burbot',
                    'email'       => 'burbot@swampsong.com',
                    'nickname'    => 'BurbotsRevenge' },
                  'credentials' => {
                     'token'      => 'yay secret' }}
  
OmniAuth.config.add_mock(:github, omniauth_hash)
