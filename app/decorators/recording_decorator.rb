class RecordingDecorator < SimpleDelegator

  def total_score
    score = JSON.parse(get_score.body)["data"]["attributes"]["total_score"]
    return score
  end

  private
  def votes_service
    Faraday.new url: "https://votes-app-1903.herokuapp.com" do |faraday|
      faraday.adapter Faraday.default_adapter
    end
  end

  def get_score
    votes_service.get do |req|
      req.url "/api/v1/recording/#{self.id}/score"
    end
  end
end
