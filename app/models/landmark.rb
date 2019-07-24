class Landmark < ApplicationRecord
  has_many :recordings
  validates_presence_of :lat, :long, :name, :address, :category, :photo_reference
  validates :place_id, presence: true, uniqueness: true

<<<<<<< HEAD
  before_save :update_md5_hash
  validates_presence_of :lat, :long, :name, :address, :category


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
=======
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
>>>>>>> 75b46aee16f8431b4b28d085c1b4ff06652e9983
end
