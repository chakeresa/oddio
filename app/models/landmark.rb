class Landmark < ApplicationRecord
  validates_presence_of :lat, :long, :name, :address, :category
  validates :place_id, presence: true, uniqueness: true
end
