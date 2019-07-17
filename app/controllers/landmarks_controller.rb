class LandmarksController < ApplicationController
  def index


      conn = Faraday.new(url: "https://api.ipgeolocationapi.com/geolocate/") do |faraday|
      faraday.adapter Faraday.default_adapter
    end
    require "pry"; binding.pry

    @lat = conn.get(request.remote_ip)['geo']['latitude']
    @long = conn.get(request.remote_ip)['geo']['longitude']

      require "pry"; binding.pry


      # Return an array of landmark objects
      # @landmarks = nearby_results.map do |landmark_data|
      #   Landmark.new(landmark_data)
      # end
    end
  end
