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
    recordings.map do |rec|
      RecordingDecorator.new(rec)
      #define total_score in decorator
    end
  end

  def landmark_total_score
    get_score = votes_service.get do |req|
      req.url "/api/v1/landmark/#{:id}/score"
    end
    score = JSON.parse(get_score.body)["data"]["attributes"]["total_score"]
    return score
    #step 1: extract api call into a service- should still return same info. PR
  end

  private

  def google_service
    @_google_service ||= GoogleService.new
  end

  def votes_service
    Faraday.new url: "https://votes-app-1903.herokuapp.com" do  |faraday|
      faraday.adapter Faraday.default_adapter
    end
  end
end
