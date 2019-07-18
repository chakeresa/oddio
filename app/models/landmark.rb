class Landmark
  # TODO: delete :rating & :place_id if not used
  attr_reader :name, :rating, :types, :lat, :lng, :place_id

  def initialize(attributes = {})
    @name = attributes[:poi][:name]
    @types = attributes[:poi][:categories]
    @lat = attributes[:position][:lat]
    @lng = attributes[:position][:lon]
  end
end
