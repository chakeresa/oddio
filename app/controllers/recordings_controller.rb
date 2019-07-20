class RecordingsController < ApplicationController
  def index
    @recordings = Recording.all
  end

  def new
    landmark = Landmark.find(params[:landmark_id])
    @recording = landmark.recordings.new
  end

  def create
    # binding.pry
    # file = File.open("app/assets/new_recording_1.mp3")
    # s3.put_object(bucket: 'oddio1903', key: 'file_1.mp3', body: file)

    file = params[:recording][:recording]
    s3 = Aws::S3::Client.new(profile: 'oddio1903', region: 'us-east-2')
    s3.put_object(bucket: 'oddio1903', key: "#{Time.now.to_s}-#{file.original_filename}", body: file)
    #add recording obj to db
  end


end
