class Landmark
  attr_reader :name, :rating, :types, :lat, :long, :place_id

  def initialize(attributes = {})
    @name = attributes[:poi][:name]
    @types = attributes[:poi][:categories]
    @lat = attributes[:position][:lat]
    @long = attributes[:position][:lon]
  end
end
