class TourList
  attr_reader :contents

  def initialize(initial_contents)
    @contents = initial_contents || Hash.new(0)
    @contents.default = 0
  end

  def total_count
    @contents.values.sum
  end

  def count_of(landmark_id)
    @contents[landmark_id.to_s]
  end

  def add_landmark(landmark_id)
    @contents[landmark_id.to_s] += 1
  end

  def remove_landmark(landmark_id)
    @contents[landmark_id.to_s] -= 1
    @contents.delete(landmark_id.to_s) if count_of(landmark_id) == 0
  end

  def landmark
    @landmark ||= load_landmark
  end

  def load_landmark
    @contents.map do |landmark_id, quantity|
      landmark = Landmark.find(landmark_id)
    end.to_a
  end
end
