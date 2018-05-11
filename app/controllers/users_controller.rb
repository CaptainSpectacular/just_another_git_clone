class UsersController < ApplicationController
  def show
    render locals: { user: GitHubUser.new(params[:slug]) }
  end
end
