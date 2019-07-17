class LandmarksController < ApplicationController
  def index
    if params[:query]
      # Connects to API with query to find latitude and longitude
      conn = Faraday.new(url: "https://maps.googleapis.com") do |faraday|
        faraday.params["key"] = ENV["GOOGLE_PLACES_API_KEY"]
        # faraday.params["query"] = "#{@query}"
        faraday.adapter Faraday.default_adapter
      end

      # Sets latitude and longitude
      text_params = {query: params[:query]}
      text_response = conn.get("/maps/api/place/textsearch/json", text_params)
      text_result = JSON.parse(text_response.body, symbolize_names: true)[:results]
      latitude = text_result[0][:geometry][:location][:lat]
      longitude = text_result[0][:geometry][:location][:lng]

      # Connects to API to return list of nearby landmarks
      nearby_params = {location: "#{latitude}, #{longitude}",
                       radius: 10000}
      nearby_response = conn.get("/maps/api/place/nearbysearch/json", nearby_params)
      nearby_results = JSON.parse(nearby_response.body, symbolize_names: true)[:results]

      # Return an array of landmark objects
      @landmarks = nearby_results.map do |landmark_data|
        Landmark.new(landmark_data)
      end
    end
  end
end
