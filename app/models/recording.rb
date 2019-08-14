class Recording < ApplicationRecord
  include Votable

  belongs_to :user
  belongs_to :landmark
  has_many :flags
  has_many :tour_recordings, depndent: :destroy
  has_many :tours, through: :tour_recordings


  validates_presence_of :title, :url
  validates_uniqueness_of :url
end
