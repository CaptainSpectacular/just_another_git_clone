class DashboardController < ApplicationController
  def index
    render locals: { users: User.all }
  end
end
