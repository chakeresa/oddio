class LandmarksController < ApplicationController


  def index

  end

  def show
    @landmark = Landmark.find(params[:id])
  end


end
