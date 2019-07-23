class User::VotesController < ApplicationController
  def create
    rating = params["type"] == "upvote" ? 1 : -1
    # post "/api/v1/#{params[:votable_type]}/#{params[:votable_id]}/create_vote/#{current_user.vote_token}/#{rating}"

    conn = Faraday.new url: "http://localhost:9393" do  |faraday|
      faraday.adapter Faraday.default_adapter
    end

    request = conn.post do |req|
      req.url "/api/v1/#{params[:votable_type]}/#{params[:votable_id]}/create_vote/#{current_user.vote_token}/#{rating}"
    end

    info = JSON.parse(request.body)

    binding.pry
  end
end
