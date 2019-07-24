class TourRecording < ApplicationRecord
  belongs_to :tour
  belongs_to :recording
end
