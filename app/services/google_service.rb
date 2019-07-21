class GoogleService
  def landmarks_place_ids(landmark)
    fetch_ids(landmark)[:candidates].first[:place_id]
  end

  def self.landmarks_place_ids(landmark)
    new.landmarks_place_ids(landmark)
  end

  def get_details(id)
    fetch_data(id)[:result]
  end

  def self.get_details(id)
    new.get_details(id)
  end

  private

  def fetch_ids(landmark)
    response = conn.get do |req|
      req.path = '/maps/api/place/findplacefromtext/json'
      req.params['input'] = "#{landmark} in Denver"
      req.params['inputtype'] = 'textquery'
    end
    JSON.parse(response.body, symbolize_names: true)
  end

  def fetch_data(id)
    response = conn.get do |req|
      req.path = '/maps/api/place/details/json'
      req.params['place_id'] = id
    end
    JSON.parse(response.body, symbolize_names: true)
  end

  def conn
    @_conn ||= Faraday.new(url: 'https://maps.googleapis.com') do |faraday|
      faraday.adapter Faraday.default_adapter
      faraday.params['key'] = ENV['GOOGLE_PLACES_API_KEY']
    end
  end
end
