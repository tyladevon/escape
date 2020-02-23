class ApplicationController < ActionController::Base
  helper_method :current_user, :available_activities

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def available_activities
    @activities = ["climbing", "hiking"]
  end
end
