class GoogleUsersController < ApplicationController
  def create
    @user = User.create_from_google(auth_hash)
    # require 'pry'; binding.pry
    # TODO: not working because password is empty but bcrypt requires it!
    redirect_to edit_google_user_path(@user.id)
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
