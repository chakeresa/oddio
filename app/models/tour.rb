class Tour < ApplicationRecord
  belongs_to :user
  has_many :tour_recordings
  has_many :recordings, through: :tour_recordings
end
