class Landmark < ApplicationRecord
  validates_presence_of :lat, :long, :name, :address, :category, :photo_reference
  validates :place_id, presence: true, uniqueness: true
end
