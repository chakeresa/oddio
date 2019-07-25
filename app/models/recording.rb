class Recording < ApplicationRecord
  belongs_to :user
  belongs_to :landmark

  validates_presence_of :title, :url
  validates_uniqueness_of :url

  def total_score
    recording = RecordingDecorator.new(self)
    recording.total_score
  end
end
