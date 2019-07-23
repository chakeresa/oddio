class User::VotesController < ApplicationController

  def check
    #if there is a vote for this resource that has this user token, run update
    #else
    #create
    #end
  end

  def create
    rating = params["type"] == "upvote" ? 1 : -1

    request = conn.post do |req|
      req.url "/api/v1/#{params[:votable_type]}/#{params[:votable_id]}/create_vote/#{current_user.vote_token}/#{rating}"
    end
    return total_score
  end


  def total_score
    get_score = conn.get do |req|
      req.url "/api/v1/#{params[:votable_type]}/#{params[:votable_id]}/score"
    end
    score = JSON.parse(get_score.body)
    # return score["data"]["attributes"]["total_score"]
    
  end


  def update_vote(id)
    rating = params["type"] == "upvote" ? 1 : -1
    request = conn.get do |req|
      req.url "/api/v1/#{params[:votable_type]}/#{params[:votable_id]}/update_vote/#{id}/#{current_user.vote_token}/#{rating}"
    end
    return total_score
  end


  private
    def conn
      Faraday.new url: "https://votes-app-1903.herokuapp.com" do  |faraday|
        faraday.adapter Faraday.default_adapter
      end
    end
end
