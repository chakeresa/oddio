class Admin::RecordingsController < Admin::BaseController
  def destroy
    recording = Recording.find_by(id: params[:id])
    if recording
      recording.destroy
    else
      flash[:danger] = "That recording cannot be deleted"
    end
    redirect_to admin_path(recording.user)
  end
end
