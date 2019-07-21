class GoogleAuthsController < ApplicationController
  def create
    require 'pry'; binding.pry
    # @user = User.create_from_google(auth_hash)
    # TODO: not working because password is empty but bcrypt requires it!
    redirect_to new_user_path
  end

  def edit
    @user = User.find(params[:id])
    if @user.update(username: params[:username])
      successful_login
    else
      flash[:danger] = @user.errors.full_messages.join('. ')
      render :new
    end
  end

  private

  def auth_hash
    request.env['omniauth.auth']
  end
end
