class AppAuthsController < ApplicationController
  def new
    @app_auth = AppAuth.new
  end
  
  def create
    @app_auth = AppAuth.new(app_auth_params)
    if @app_auth.save
      session[:auth_type] = "app_auth"
      session[:auth_id] = @app_auth.id
      redirect_to new_user_path
    else
      flash[:danger] = @app_auth.errors.full_messages.join('. ')
      render :new
    end
  end

  private

  def app_auth_params
    params.require(:app_auth).permit(:username, :password, :password_confirmation)
  end
end
