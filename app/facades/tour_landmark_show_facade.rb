class TourLandmarkShowFacade
  def initialize(landmark_id, tour_id)
    @landmark_id = landmark_id
    @tour_id = tour_id
  end
  
  def landmark
    @_landmark ||= Landmark.find(@landmark_id)
  end

  def picture
    landmark.photo_reference
  end
  
  def tour
    @_tour ||= Tour.find(@tour_id)
  end

  def recordings
    @_recordings ||= tour.recordings_for_landmark(landmark)
  end
end
