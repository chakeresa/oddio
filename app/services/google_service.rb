class GoogleService
  def get_place_id(landmark_name)
    id_hash = fetch_id(landmark_name)
    id_hash[:candidates].empty? ? nil : id_hash[:candidates].first[:place_id]
  end

  def self.get_place_id(landmark_name)
    new.get_place_id(landmark_name)
  end

  def get_details(id)
    fetch_details(id)[:result]
  end

  def self.get_details(id)
    new.get_details(id)
  end

  def get_picture(photo_reference)
    response = conn.get do |req|
      req.path = '/maps/api/place/photo'
      req.params['photoreference'] = photo_reference
      req.params['maxheight'] = 800
      req.params['maxwidth'] = 800
    end
    string = response.body
    start = string.index('HREF') + 6
    finish = string.index('>here') - 2
    string[start..finish]
  end

  private

  def fetch_id(landmark_name)
    response = conn.get do |req|
      req.path = '/maps/api/place/findplacefromtext/json'
      req.params['input'] = "#{landmark_name} in Denver"
      req.params['inputtype'] = 'textquery'
    end
    JSON.parse(response.body, symbolize_names: true)
  end

  def fetch_details(id)
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
