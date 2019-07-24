class LandmarksShowFacade
  attr_reader :id

  def initialize(id)
    @id = id
  end

  def landmark
    @_landmark ||= Landmark.find(@id)
  end

  def picture
    get_picture(landmark.photo_reference)
  end

  private

  def service
    @_service ||= GoogleService.new
  end

  def get_picture(photo_reference)
    @_get_picture ||= service.get_picture(photo_reference)
  end
end
