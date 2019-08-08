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
end
