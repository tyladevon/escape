class WelcomeController < ApplicationController
  before_action :redirect_current_users

  def index
  end 

  private

  def redirect_current_users
    if current_user
      redirect_to profile_path
    end
  end
end
