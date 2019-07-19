class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def new_google
    @user = User.create_from_google(auth_hash)
  end

  def create
    @user = User.new(user_params)
    if @user.save
      successful_save
    else
      flash[:danger] = @user.errors.full_messages.join('. ')
      render :new
    end
  end

  def create_google
    @user = User.find(params[:id])
    if @user.update(username: params[:username])
      successful_save
    else
      flash[:danger] = @user.errors.full_messages.join('. ')
      render :new_google
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :password, :password_confirmation)
  end

  def auth_hash
    request.env['omniauth.auth']
  end

  def successful_save
    flash[:success] = "Welcome, #{@user.username}!"
    session[:user_id] = @user.id
    redirect_to landmarks_path
  end
end
