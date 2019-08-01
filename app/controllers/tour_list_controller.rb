class TourListController < ApplicationController
  def show

  end

  def destroy
    session.delete(:tour_list)

    redirect_to tour_list_path
  end
end
