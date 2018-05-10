class RepositoriesController < ApplicationController
  def index

  end

  def show
    render locals: { commits: RepositoryFinder.new(params[:user_slug], params[:repo]).commits }
  end
end
