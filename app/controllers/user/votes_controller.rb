class User::VotesController < ApplicationController
  def create
    response = VoteService.new(vote_service_params).request_create
    hash = JSON.parse(response.body, symbolize_names: true)
    total_score = hash[:data][:attributes][:total_score]
    render json: { new_score: total_score }
  end

  private

  def vote_service_params
    {
      votable_type: params[:votable_type],
      votable_id: params[:votable_id],
      type: params[:type],
      vote_token: current_user.vote_token
    }
  end
end
