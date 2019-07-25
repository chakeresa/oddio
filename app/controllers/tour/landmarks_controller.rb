class Tour::LandmarksController < ApplicationController
  def show
    render locals: {
      facade: TourLandmarkShowFacade.new(params[:id], params[:tour_id])
    }
  end
end
