class LandmarksShowFacade
  attr_reader :id

  def initialize(id)
    @id = id
  end

  def landmark
    @_landmark ||= Landmark.find(@id)
  end

  def landmark_category
    landmark.category.capitalize
  end

  def picture
    @_picture ||= google_service.get_picture(landmark.photo_reference)
  end

  def landmark_recordings
    landmark.recordings
  end

  private

  def google_service
    @_google_service ||= GoogleService.new
  end
end
