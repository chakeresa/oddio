class User::VotesXController < ApplicationController
  def create
    response = request_create
    hash = JSON.parse(response.body, symbolize_names: true)
    total_score = hash[:data][:attributes][:total_score]
    render json: { new_score: total_score }
  end

  private

  # TODO: abstract methods below into votes api service
  def conn
    Faraday.new url: "https://votes-app-1903.herokuapp.com" do |faraday|
      faraday.adapter Faraday.default_adapter
    end
  end

  def request_create
    rating = params["type"] == "upvote" ? 1 : -1
    request = conn.post do |req|
      req.url "/api/v1/#{params[:votable_type]}/#{params[:votable_id]}/create_vote/#{current_user.vote_token}/#{rating}"
    end
  end
end
