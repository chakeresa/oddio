class TourList::LandmarksController < TourList::BaseController
  def create
    landmark = Landmark.find(params[:landmark_id])
    unless tour_list.contents.keys.include?(landmark.id.to_s)
      tour_list.add_landmark(landmark.id)
      session[:tour_list] = tour_list.contents
      flash[:success] = "You have added #{landmark.name} to your tour list. You have #{tour_list.total_count} landmark(s) in your tour list."
    else
      flash[:danger] = "You already have #{landmark.name} in your tour list."
    end

    redirect_back fallback_location: landmarks_path
  end

  def destroy
    landmark = Landmark.find(params[:id])
    tour_list.remove_landmark(landmark.id)
    session[:tour_list] = tour_list.contents
    flash[:success] = "#{landmark.name} has been removed from your tour list."

    redirect_back fallback_location: tour_list_path
  end
end
