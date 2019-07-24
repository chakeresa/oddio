class Landmark < ApplicationRecord
  has_many :recordings

  validates_presence_of :lat, :long, :name, :address, :category

  def total_score(id)
    get_score = conn.get do |req|
      req.url "/api/v1/landmark/#{id}/score"
    end
    score = JSON.parse(get_score.body)["data"]["attributes"]["total_score"]
    return score
  end

  private
    def conn
      Faraday.new url: "https://votes-app-1903.herokuapp.com" do  |faraday|
        faraday.adapter Faraday.default_adapter
      end
    end
end
