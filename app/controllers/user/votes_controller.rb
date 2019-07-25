class User::VotesController < ApplicationController
  def create
    rating = params["type"] == "upvote" ? 1 : -1
    request = conn.post do |req|
      req.url "/api/v1/#{params[:votable_type]}/#{params[:votable_id]}/create_vote/#{current_user.vote_token}/#{rating}"
    end

    if params[:votable_type] == "recording"
      recording = Recording.find(params[:votable_id])
      redirect_to landmark_path(recording.landmark)
    else
      redirect_to landmark_path(params[:votable_id])
    end
  end

  private

  # def update_vote(id)
  #   rating = params["type"] == "upvote" ? 1 : -1
  #   request = conn.get do |req|
  #     req.url "/api/v1/#{params[:votable_type]}/#{params[:votable_id]}/update_vote/#{id}/#{current_user.vote_token}/#{rating}"
  #   end
  #   return total_score
  # end

  def conn
    Faraday.new url: "https://votes-app-1903.herokuapp.com" do |faraday|
      faraday.adapter Faraday.default_adapter
    end
  end
end
