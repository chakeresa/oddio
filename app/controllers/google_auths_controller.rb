class GoogleAuthsController < ApplicationController
  def create
    if google_auth = GoogleAuth.find_by(uid: auth_hash["uid"])
      # TODO: need to update the stored token if google sends back a different one?
      @user = google_auth.user
      successful_login
    else
      auth_resource.save
      make_new_user
      send_to_new_user_page
    end
  end

  private

  def auth_hash
    request.env['omniauth.auth']
  end

  def auth_resource
    @auth_resource ||= GoogleAuth.new(
      uid: auth_hash["uid"],
      token: auth_hash["credentials"]["token"]
    )
  end

  def make_new_user
    @user = User.new(
      email: auth_hash["info"]["email"],
      first_name: auth_hash["info"]["first_name"],
      last_name: auth_hash["info"]["last_name"]
    )
  end

  def send_to_new_user_page
    session[:auth_type] = "google_auth"
    session[:auth_id] = auth_resource.id
    render 'users/new'
  end
end
