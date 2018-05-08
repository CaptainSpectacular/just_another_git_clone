class SessionsController < ApplicationController
  def create
    if auth_hash
      user = User.from_omniauth(auth_hash)
      session[:user_id] = user.id
    end
    redirect_to root_path
  end

  protected

  def auth_hash
    request.env['omniauth.auth']
  end
end
