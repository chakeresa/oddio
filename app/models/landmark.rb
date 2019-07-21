class Landmark < ApplicationRecord
  has_many :recordings

  validates_presence_of :lat, :long, :name, :address, :category
end
