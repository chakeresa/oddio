class LandmarkSerializer
  include FastJsonapi::ObjectSerializer
  attributes :name, :lat, :long, :address, :type, :photo_url, :phone, :website
end
