class RecordingsController < ApplicationController
  def index
    @recordings = Recording.all
  end

  def new
    if current_user
      landmark = Landmark.find(params[:landmark_id])
      @recording = landmark.recordings.new
    else
      flash.now[:error] = "You must be logged in to make a recording."
      redirect_to landmark_path(landmark))
    end
  end

  def create
    if current_user
      file = params[:recording][:recording]
      ran = SecureRandom.hex
      file_name = "#{ran}.mp3"
      s3 = Aws::S3::Client.new(profile: 'oddio1903', region: 'us-east-2')
      s3.put_object(bucket: 'oddio1903', key: file_name, body: file)
      recording = Recording.new(
        user: current_user,
        landmark_id: params[:landmark_id].to_i,
        url: "https://#{ENV['AWS_BUCKET']}.s3.#{ENV['AWS_REGION']}.amazonaws.com/#{file_name}",
        title: params[:recording][:title]
      )
      if recording.save!
        flash[:success] = "Your recording has been saved."
        redirect_to landmark_path(params[:landmark_id])
      else
        flash.now[:error] = "Unable to save recording."
        render :new
      end
    else
      flash[:error] = "You must be logged in to make a recording."
      redirect_to landmark_path(Landmark.find(params[:landmark_id]))
    end
  end


end
