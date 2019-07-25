class LandmarksController < ApplicationController
  def index
    @tours = Tour.all
  end

  def show
    render locals: {
      facade: LandmarksShowFacade.new(params[:id])
    }
  end
end
