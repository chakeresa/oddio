class Recording < ApplicationRecord
  include Votable

  belongs_to :user
  belongs_to :landmark
<<<<<<< HEAD
  has_many :flags
  has_many :tour_recordings
=======
  has_many :tour_recordings, dependent: :destroy
>>>>>>> e7a2588522841442b08f83e1a8b21660d596c155
  has_many :tours, through: :tour_recordings


  validates_presence_of :title, :url
  validates_uniqueness_of :url
end
