class TourList
  attr_reader :landmark_contents

  def initialize(initial_contents)
    @landmark_contents = initial_contents || Hash.new(0)
    @landmark_contents.default = 0
    @recording_contents = Hash.new(0)
  end

  def total_count
    @landmark_contents.values.sum
  end

  def count_of(landmark_id)
    @landmark_contents[landmark_id.to_s]
  end

  def add_landmark(landmark_id)
    if count_of(landmark_id) == 0
      @landmark_contents[landmark_id.to_s] += 1
    end
  end

  def remove_landmark(landmark_id)
    if count_of(landmark_id) == 1
      @landmark_contents[landmark_id.to_s] -= 1
      @landmark_contents.delete(landmark_id.to_s) if count_of(landmark_id) == 0
    end
  end

  def landmarks
    @landmarks ||= load_landmark
  end

  def load_landmark
    @landmark_contents.map do |landmark_id, quantity|
      landmark = Landmark.find(landmark_id)
    end.to_a
  end

  def add_recording(recording_id)
    if count_of(recording_id) == 0
      @recording_contents[recording_id.to_s] += 1
    end
  end

  def remove_recording(recording_id)
    if count_of(recording_id) == 1
      @recording_contents[recording_id.to_s] -= 1
      @recording_contents.delete(recording_id.to_s) if count_of(recording_id) == 0
    end
  end
end
