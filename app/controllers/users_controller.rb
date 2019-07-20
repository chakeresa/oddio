class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      successful_login
    else
      flash[:danger] = @user.errors.full_messages.join('. ')
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:display_name, :email, :first_name, :last_name)
  end
end
