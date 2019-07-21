class GoogleAuthsController < ApplicationController
  def create
    uid = auth_hash[:uid]
    if google_auth = GoogleAuth.find_by(uid: uid)
      # TODO: need to update the stored token if google sends back a different one?
      @user = google_auth.user
      successful_login
    else
      if new_auth = auth_resource.save
        @user = User.new(
          email: auth_hash[:info][:email],
          first_name: auth_hash[:info][:first_name],
          last_name: auth_hash[:info][:last_name]
        )
        session[:auth_type] = "google_auth"
        session[:auth_id] = auth_resource.id
        render 'users/new'
      else
        flash[:danger] = auth_resource.errors.full_messages.join('. ')
        redirect_to landmarks_path
      end
    end
  end

  private

  def auth_hash
    request.env['omniauth.auth']
  end

  def auth_resource
    @auth_resource ||= GoogleAuth.new(
      uid: auth_hash[:uid],
      token: auth_hash[:info][:credentials][:token]
    )
  end
end
