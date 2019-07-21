class GoogleAuthsController < ApplicationController
  def create
    uid = auth_hash[:uid]
    if google_auth = GoogleAuth.find_by(uid: uid)
      # TODO: need to update the stored token if google sends back a different one?
      @user = google_auth.user
      successful_login
    else
      # TODO: change create! to new / save with error if false
      new_auth = GoogleAuth.create!(
        uid: uid,
        token: auth_hash[:info][:credentials][:token]
      )
      @user = User.new(
        email: auth_hash[:info][:email],
        first_name: auth_hash[:info][:first_name],
        last_name: auth_hash[:info][:last_name]
      )
      render 'users/new'
    end
  end

  private

  def auth_hash
    request.env['omniauth.auth']
  end
end
