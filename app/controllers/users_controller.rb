class UsersController < ApplicationController
  def create
    google_auth_hash = request.env["omniauth.auth"]
    google_token = google_auth_hash["credentials"]
    uid = google_auth_hash["uid"]
    user_info = google_auth_hash["info"]
    #name, email, first_name, last_name, image, google_token
    user = User.create!(
                      first_name: user_info["first_name"],
                      last_name: user_info["last_name"],
                      email: user_info["email"],
                      image: user_info["image"],
                      google_token: google_token)
    session[:user_id] = user.id
    redirect_to '/profile'
  end

  def show
  end

  private

  # def google_auth_hash
  #   request.env["omniauth.auth"]
  # end
  #
  # def google_token
  #   google_auth_hash["credentials"]
  # end
  #
  # def uid
  #   google_auth_hash["uid"]
  # end
  #
  # def user_info
  #   google_auth_hash["info"]
  # end
end
