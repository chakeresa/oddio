class LandmarkSerializer
  include FastJsonapi::ObjectSerializer
  attributes :name, :lat, :long, :address, :category, :phone_number 
end
