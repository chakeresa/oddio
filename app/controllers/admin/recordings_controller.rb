class Admin::RecordingsController < Admin::BaseController
  def destroy
    recording = Recording.find_by(id: params[:id])
    recording.destroy

    redirect_to admin_path(recording.user)
  end
end
