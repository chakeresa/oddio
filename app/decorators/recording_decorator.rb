class RecordingDecorator < SimpleDelegator

  def total_score
    JSON.parse(get_score.body)["data"]["attributes"]["total_score"]
  end

  private
  def votes_service
    Faraday.new url: ENV['VOTES_APP'] do |faraday|
      faraday.adapter Faraday.default_adapter
    end
  end

  def get_score
    votes_service.get do |req|
      req.url "/api/v1/recording/#{self.id}/score"
    end
  end
end
