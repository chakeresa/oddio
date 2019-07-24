class ToursController < ApplicationController
  def index
    @tours = Tour.all
  end

  def show
  end
end
