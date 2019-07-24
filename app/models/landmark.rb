class Landmark < ApplicationRecord
  has_many :recordings
  validates_presence_of :lat, :long, :name, :address, :category, :photo_reference
  validates :place_id, presence: true, uniqueness: true

  before_save :update_md5_hash
  validates_presence_of :lat, :long, :name, :address, :category

  def total_score
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

    def update_md5_hash
      self.md5_hash = Digest::MD5.hexdigest(
        "#{self.name}
        #{self.place_id}
        #{self.address}
        #{self.phone_number}
        #{self.category}
        #{self.website}
        #{self.photo_reference}"
      )
    end
end
