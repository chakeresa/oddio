class GoogleAuthsController < ApplicationController
  def create
    google_auth = GoogleAuth.find_by(uid: auth_hash["uid"])
    if google_auth && google_auth.user
      @user = google_auth.user
      successful_login
    else
      # TODO: need to update the stored token if google sends back a different one?
      new_auth_resource unless google_auth
      make_new_user
      send_to_new_user_page(google_auth || new_auth_resource)
    end
  end

  private

  def auth_hash
    request.env['omniauth.auth']
  end

  def new_auth_resource
    @new_auth_resource ||= GoogleAuth.create(
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

  def send_to_new_user_page(auth_resource)
    session[:auth_type] = "google_auth"
    session[:auth_id] = auth_resource.id
    render 'users/new'
  end
end
