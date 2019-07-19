class LandmarksController < ApplicationController
  def index
    # TODO: Refactor huge method --
    #       Create TomTomApiService & LandmarkIndex Facade
    # If there is a search param
    if params[:query]
      # Connects to TomTom API with query to find latitude and longitude
      tomtom_query_conn = Faraday.new(url: 'https://api.tomtom.com') do |faraday|
        faraday.params['key'] = ENV['TOMTOM_API_KEY']
        faraday.params['[limit]'] = 1
        faraday.adapter Faraday.default_adapter
      end

      # Connects to TomTom API for nearby search
      tomtom_nearby_conn = Faraday.new(url: 'https://api.tomtom.com') do |faraday|
        faraday.params['key'] = ENV['TOMTOM_API_KEY']
        faraday.params['[limit]'] = 100
        faraday.params['[radius]'] = 10000
        faraday.params['[categorySet]'] = '9362, 7317, 7318'
        faraday.adapter Faraday.default_adapter
      end

      # Sets latitude and longitude
      query_response = tomtom_query_conn.get("/search/2/geocode/#{params[:query]}.json")
      query_result = JSON.parse(query_response.body, symbolize_names: true)[:results]
      search_latitude = query_result[0][:position][:lat]
      search_longitude = query_result[0][:position][:lon]

      # Sets to TomTom API to return list of nearby landmarks
      nearby_params = {lat: search_latitude,
                       lon: search_longitude}
      nearby_response = tomtom_nearby_conn.get('/search/2/nearbySearch.json', nearby_params)
      nearby_results = JSON.parse(nearby_response.body, symbolize_names: true)[:results]

      # Return an array of landmark objects
      require "pry"; binding.pry
      @landmarks = nearby_results.map do |landmark_data|
        Landmark.new(landmark_data)
      end
      @parks = @landmarks.select{|landmark| landmark.types == ["park recreation area"]}
      @museums = @landmarks.select{|landmark| landmark.types == ["museum"]}
      @theaters = @landmarks.select{|landmark| landmark.types == ["theater"]}
      @latitude = nearby_params[:lat]
      @longitude = nearby_params[:lon]
    else
      @latitude = 39.7392
      @longitude = -104.9903
    end


  end
end
