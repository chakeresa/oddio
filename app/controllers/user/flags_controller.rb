class User::FlagsController < User::BaseController

  def create
    recording = Recording.find(params['recording_id'])
    unless recording.flags.find_by(user_id: current_user.id)
      Flag.create(user_id: current_user.id, recording_id: params['recording_id'])
    end
    redirect_back fallback_location: root_path
  end
end
