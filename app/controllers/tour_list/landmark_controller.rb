class TourList::LandmarkController < ApplicationController
  def create
    landmark = Landmark.find(params[:id])
    unless tour_list.contents.keys.include?(landmark.id.to_s)
      tour_list.add_landmark(landmark.id)
      flash[:notice] = "You have added #{landmark.name} to your tour list."
      session[:tour_list] = tour_list.contents
      flash[:success] = "You have #{tour_list.total_count} landmarks in your tour list."
    else
      flash[:notice] = "You already have #{landmark.name} in your tour list."
    end

    redirect_to landmarks_path
  end
end
