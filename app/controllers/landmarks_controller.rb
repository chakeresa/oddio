class LandmarksController < ApplicationController
  def index
  end

  def show
    render locals: {
      facade: LandmarksShowFacade.new(params[:id])
    }
  end
end
