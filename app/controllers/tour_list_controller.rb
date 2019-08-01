class TourListController < ApplicationController
  before_action :require_user

  def show

  end

  def destroy
    session.delete(:tour_list)

    redirect_to tour_list_path
  end
end
