class SessionsController < ApplicationController
  def new
  end
  
  def create
    @user = User.find_by(username: params[:username].downcase)
    if @user && @user.authenticate(params[:password])
      successful_login
    else
      flash[:danger] = 'Incorrect username/password combination'
      render :new
    end
  end
  
  def destroy
    # TODO
  end
end
