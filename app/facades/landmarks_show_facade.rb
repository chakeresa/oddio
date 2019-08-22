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
    landmark.photo_reference
  end

  def landmark_recordings
    collection = landmark.recordings
    Recording.sort('recording', collection)
  end
end
