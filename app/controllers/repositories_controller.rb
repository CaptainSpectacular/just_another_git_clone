class RepositoriesController < ApplicationController
  def show
    render locals: { repository: Repository.from_params(repo_params) }
  end

  private

  def repo_params
    params.permit(:repo, :user_slug)
  end
end
