class TomTomService
  def initialize(filter = {})
    @filter = filter
  end

  def self.type_search(filter = {})
    new({"[#{filter.keys.join}]" => filter.values.join}).type_search
  end

  def type_search
    get_json('/search/2/nearbySearch.json')
  end

  private
  attr_reader :filter

  def get_json(url)
    response = conn.get(url, default_filter.merge(filter))
    JSON.parse(response.body, symbolize_names: true)[:results]
  end

  def conn
    Faraday.new(url: 'https://api.tomtom.com') do |faraday|
      faraday.params['[limit]'] = 100
      faraday.params['[radius]'] = 20000
      faraday.adapter Faraday.default_adapter
    end
  end

  def default_filter
    {
      'key' => ENV['TOMTOM_API_KEY'],
      'lat' => 39.7392358,
      'lon' => -104.990251,
    }
  end
end
