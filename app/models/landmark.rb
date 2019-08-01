class Landmark < ApplicationRecord
  has_many :recordings
  has_many :tours, through: :recordings

  validates_presence_of :lat, :long, :name, :address, :category, :photo_reference
  validates :place_id, presence: true, uniqueness: true

  before_save :update_md5_hash

  # TODO: abstract into a Votable module & include in several classes
  def total_score
    parameters = {
      votable_type: self.class.to_s.downcase,
      votable_id: self.id
    }
    VoteService.new(parameters).total_score
  end

  private

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
