class UsersController < ApplicationController
  def show
    if current_user.nil? 
      flash[:error] = "Please log in to continue"
      redirect_to '/'
    end
  end
end
