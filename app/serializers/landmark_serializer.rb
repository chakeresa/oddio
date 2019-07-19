class LandmarkSerializer
  include FastJsonapi::ObjectSerializer
  attributes :name, :lat, :long, :address, :category, :photo_url, :phone, :website
end
