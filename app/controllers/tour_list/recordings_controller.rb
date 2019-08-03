class TourList::RecordingsController < TourList::BaseController
  def index
    render locals: {
      facade: LandmarksShowFacade.new(params[:landmark_id])
    }
  end

  def new
    landmark = Landmark.find(params[:landmark_id])
    @recording = landmark.recordings.new
  end

  def create
    file = params[:recording][:recording]
    ran = SecureRandom.hex
    file_name = "#{ran}.mp3"
    s3 = Aws::S3::Client.new(profile: 'oddio1903', region: 'us-east-2')
    s3.put_object(bucket: 'oddio1903',
                  key: file_name,
                  body: file,
                  content_type: 'audio/mpeg')
    recording = Recording.new(
      user: current_user,
      landmark_id: params[:landmark_id].to_i,
      url: "https://#{ENV['AWS_BUCKET']}.s3.#{ENV['AWS_REGION']}.amazonaws.com/#{file_name}",
      title: params[:recording][:title]
    )
    if recording.save!
      tour_recording.add_recording(recording)
      flash[:success] = 'Your recording has been saved.'
      session[:tour_recording] = tour_recording.contents
      redirect_to tour_list_path
    else
      flash.now[:error] = 'Unable to save recording.'
      render :new
    end
  end

  def destroy
    recording = Recording.find_by(id: params[:id])
    if recording
      tour_recording.remove_recording(recording)
      session[:tour_recording] = tour_recording.contents
      recording.destroy
      flash[:success] = 'Your recording has been deleted.'
    else
      flash[:danger] = 'That recording cannot be deleted'
    end
    redirect_to tour_list_path
  end

  def update
    recording = Recording.find_by(id: params[:id])
    tour_recording.add_recording(recording)
    flash[:success] = 'The recording has been saved.'
    session[:tour_recording] = tour_recording.contents
    redirect_to tour_list_path
  end
end
