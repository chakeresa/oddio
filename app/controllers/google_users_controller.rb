class GoogleUsersController < ApplicationController
  def new
    @user = User.create_from_google(auth_hash)
  end

  def create
    @user = User.find(params[:id])
    if @user.update(username: params[:username])
      successful_save
    else
      flash[:danger] = @user.errors.full_messages.join('. ')
      render :new
    end
  end

  private

  def auth_hash
    request.env['omniauth.auth']
  end

  def successful_save
    flash[:success] = "Welcome, #{@user.username}!"
    session[:user_id] = @user.id
    redirect_to landmarks_path
  end
end
