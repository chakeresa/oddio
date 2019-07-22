class ApplicationController < ActionController::Base
  helper_method :current_user,
                :current_user?,
                :current_admin?

  private

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def current_user?
    current_user && current_user.user?
  end

  def current_admin?
    current_user && current_user.admin?
  end

  def successful_login
    flash[:success] = "Welcome, #{@user.first_name}!"
    session[:user_id] = @user.id
    redirect_to landmarks_path
  end
end
