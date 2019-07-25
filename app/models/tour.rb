class Tour < ApplicationRecord
  belongs_to :user
  has_many :tour_recordings
  has_many :recordings, through: :tour_recordings

  def recordings_for_landmark(landmark)
    recordings.where(recordings: {landmark: landmark})
  end
end
