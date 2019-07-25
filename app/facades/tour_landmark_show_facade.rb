class TourLandmarkShowFacade
  def initialize(landmark_id, tour_id)
    @landmark_id = landmark_id
    @tour_id = tour_id
  end
  
  def landmark
    @_landmark ||= Landmark.find(@landmark_id)
  end

  def picture
    @_picture ||= google_service.get_picture(landmark.photo_reference)
  end
  
  def tour
    @_tour ||= Tour.find(@tour_id)
  end

  def recordings
    # TODO: add method in Recording model instead of using 'where' here
    @_recordings ||= @tour.recordings.where(recordings: {landmark: @landmark})
  end

  private

  def google_service
    @_google_service ||= GoogleService.new
  end
end
