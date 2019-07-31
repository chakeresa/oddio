class Tour < ApplicationRecord
  belongs_to :user
  has_many :tour_recordings
  has_many :recordings, through: :tour_recordings
  has_many :landmarks, through: :recordings

  def recordings_for_landmark(landmark)
    recordings.where(recordings: {landmark: landmark})
  end

  def total_score
    tour = TourDecorator.new(self)
    tour.total_score
  end
end
