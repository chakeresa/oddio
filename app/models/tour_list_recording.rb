class TourListRecording
  attr_reader :contents

  def initialize(initial_contents)
    @contents = initial_contents || Hash.new(0)
    @contents.default = 0
  end

  def add_recording(recording)
    @contents[recording.id.to_s] = recording.landmark_id
  end

  def remove_recording(recording)
    @contents.delete(recording.id.to_s)
  end

  # def landmarks
  #   @landmarks ||= load_landmark
  # end
  #
  # def load_landmark
  #   @landmark_contents.map do |landmark_id, quantity|
  #     landmark = Landmark.find(landmark_id)
  #   end.to_a
  # end
end
