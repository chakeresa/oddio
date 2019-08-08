class Tour < ApplicationRecord
  include Votable

  belongs_to :user
  has_many :tour_recordings
  has_many :recordings, through: :tour_recordings
  has_many :landmarks, through: :recordings

  def recordings_for_landmark(landmark)
    recordings.where(recordings: {landmark: landmark})
  end
end
