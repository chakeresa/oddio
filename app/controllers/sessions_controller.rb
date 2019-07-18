class SessionsController < ApplicationController
  def new
  end
  
  def create
    user = User.find_by(username: params[:username])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      flash[:success] = "Welcome, #{user.username}!"
      redirect_to landmarks_path
    else
      flash[:danger] = "Incorrect username/password combination"
      render :new
    end
  end
  
  def destroy
    # TODO
  end
end
