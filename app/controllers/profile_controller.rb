class ProfileController < ApplicationController
  def show
    render locals: { user: current_user }
  end
end
