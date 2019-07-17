class Landmark
  attr_reader :name, :rating, :types, :lat, :lng, :place_id

  def initialize(attributes = {})
    @name = attributes[:name]
    @rating = attributes[:rating]
    @types = attributes[:types]
    @lat = attributes[:geometry][:location][:lat]
    @lng = attributes[:geometry][:location][:lng]
    @place_id = attributes[:place_id]
  end
end
