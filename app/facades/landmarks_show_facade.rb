class LandmarksShowFacade
  attr_reader :id

  def initialize(id)
    @id = id
  end

  def landmark
    @_landmark ||= Landmark.find(@id)
  end

  def picture
    "https://maps.googleapis.com/maps/api/place/photo?maxheight=400&maxwidth=600&key=#{ENV['GOOGLE_PLACES_API_KEY']}&photoreference=#{landmark.photo_reference}"
  end
end
