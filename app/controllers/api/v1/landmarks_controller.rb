class Api::V1::LandmarksController < ApplicationController

  def index
    render json: LandmarkSerializer.new(Landmark.all)
  end

  def show
    info = GoogleService.get_place_id(params[:id])
    render json: LandmarkSerializer.new(Landmark.find_by(place_id: info))
  end

end
