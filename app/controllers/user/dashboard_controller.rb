class User::DashboardController < User::BaseController
  def index
    @user = User.find(current_user.id)
  end

  def destroy
    recording = current_user.recordings.find_by(id: params[:id])
    if recording
      recording.destroy
    else
      flash[:danger] = "That recording cannot be deleted"
    end
    redirect_to user_dashboard_path
  end
end
