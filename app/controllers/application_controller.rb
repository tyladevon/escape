class ApplicationController < ActionController::Base
  helper_method :current_user, :require_current_user

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def require_current_user
    unless current_user
      flash[:error] = "Please log in to continue"
      redirect_to '/'
    end
  end
end
