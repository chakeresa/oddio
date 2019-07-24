class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      add_user_id_to_auth_resource
      successful_login
    else
      flash.now[:danger] = @user.errors.full_messages.join('. ')
      render :new
    end
  end

  def show
    @user = User.find(params[:id])
  end

  private

  def user_params
    params.require(:user).permit(:display_name, :email, :first_name, :last_name)
  end

  def add_user_id_to_auth_resource
    case session[:auth_type]
    when 'app_auth'
      auth = AppAuth.find(session[:auth_id])
    when 'google_auth'
      auth = GoogleAuth.find(session[:auth_id])
    end
    auth.update(user: @user)
  end
end
