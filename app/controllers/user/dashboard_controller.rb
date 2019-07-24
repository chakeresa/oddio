class User::DashboardController < User::BaseController
  def index
    @user = User.find(current_user.id)
  end

  def destroy
    recording = Recording.find(params[:id])
    if recording && recording.user == current_user
      recording.destroy
      redirect_to user_dashboard_path
    else
      render file: 'public/404', status: 404
    end
  end
end
