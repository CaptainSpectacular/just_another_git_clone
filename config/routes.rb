Rails.application.routes.draw do
  root to: 'dashboard#index'

  get '/dashboard', to: 'dashboard#index'
  get '/auth/github', as: :github_login
  get '/auth/github/callback', to: 'sessions#create'

  resources :users, only: %i[show]
end
