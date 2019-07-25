class SessionsController < ApplicationController
  def new
  end

  def create
    app_auth = AppAuth.find_by(username: params[:username].downcase)
    @user = app_auth.user if app_auth
    if @user && app_auth.authenticate(params[:password])
      successful_login
    else
      flash.now[:danger] = 'Incorrect username/password combination'
      render :new
    end
  end

  def destroy
    reset_session
    flash[:success] = 'Logged out. See you next time!'
    redirect_to root_path
  end
end
