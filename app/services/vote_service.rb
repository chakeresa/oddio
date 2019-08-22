class VoteService
  def initialize(parameters)
    @votable_type = parameters[:votable_type]
    @votable_id = parameters[:votable_id]
    @type = parameters[:type]
    @vote_token = parameters[:vote_token]
    @array_of_ids = parameters[:array_of_ids]
  end

  def total_score
    response = conn.get do |req|
      req.url "/api/v1/#{@votable_type}/#{@votable_id}/score"
    end
    JSON.parse(response.body)["data"]["attributes"]["total_score"]
  end
  
  def request_create
    request = conn.post do |req|
      req.url "/api/v1/#{@votable_type}/#{@votable_id}/create_vote/#{@vote_token}/#{rating}"
      req.params['api_key'] = ENV['VOTES_API_KEY']
    end
  end
  
  def sort
    query_params = 'ids[]=' + @array_of_ids.join('&ids[]=')

    response = conn.get do |req|
      req.url "/api/v1/sort_by_rating/#{@votable_type}?#{query_params}"
    end
    JSON.parse(response.body)
  end

  private

  def conn
    Faraday.new url: "https://votes-app-1903.herokuapp.com" do  |faraday|
      faraday.adapter Faraday.default_adapter
    end
  end

  def rating
    @type == "upvote" ? 1 : -1
  end
end
