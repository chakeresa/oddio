class Landmark < ApplicationRecord
  validates_presence_of :lat, :long, :name, :address, :category
end
