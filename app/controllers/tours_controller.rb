class ToursController < ApplicationController
  def index
    @tours = Tour.all
  end

  def show
    @tour = Tour.find(params[:id])
  end

  def create
    unless all_landmarks_have_recordings?
      flash[:danger] = "Make sure to add a recording to all landmarks."

      redirect_to tour_list_path
    else
      tour = Tour.create(user_id: current_user.id, title: params[:tour][:title])

      tour_recording.contents.keys.each do |key|
        TourRecording.create(tour_id: tour.id, recording_id: key.to_i)
      end

      flash[:success] = "Your tour has been created."
      session[:tour_list] = nil
      session[:tour_recording] = nil
      redirect_to user_dashboard_path
    end
  end

  private

  def all_landmarks_have_recordings?
    landmarks = tour_list.contents.keys.map {|landmark_id, quantity| landmark_id.to_i}
    recordings = tour_recording.contents.values
    Set.new(landmarks) == Set.new(recordings)
  end
end
