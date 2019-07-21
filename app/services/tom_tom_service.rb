class TomTomService
  def category_search(category)
    fetch_data(category)[:results]
  end

  def self.category_search(category)
    new.category_search(category)
  end

  private

  def fetch_data(category)
    response = conn.get do |req|
      req.path = '/search/2/nearbySearch.json'
      req.params['lat'] = 39.7392358
      req.params['lon'] = -104.990251
      req.params['[limit]'] = 100
      req.params['[radius]'] = 20000
      req.params['[categorySet]'] = category[:categorySet]
    end
    JSON.parse(response.body, symbolize_names: true)
  end

  def conn
    @_conn ||= Faraday.new(url: 'https://api.tomtom.com') do |faraday|
      faraday.params['key'] = ENV['TOMTOM_API_KEY']
      faraday.adapter Faraday.default_adapter
    end
  end
end
