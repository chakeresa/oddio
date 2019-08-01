class Landmark < ApplicationRecord
  include Votable
  
  has_many :recordings
  has_many :tours, through: :recordings

  validates_presence_of :lat, :long, :name, :address, :category, :photo_reference
  validates :place_id, presence: true, uniqueness: true

  before_save :update_md5_hash

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
