class Api::V1::LandmarksController < ApplicationController

  def index
    render json: LandmarkSerializer.new(Landmark.all)
  end

  def show
    render json: LandmarkSerializer.new(Landmark.find(params['id']))
  end

end
