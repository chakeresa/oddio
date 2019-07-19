require "rails_helper"

RSpec.describe TomTomService do
  it "gets results" do
    VCR.use_cassette('tomtom_service_type_search') do
      results = TomTomService.type_search(categorySet: 7317)

      expect(results.first).to have_key(:poi)
      expect(results.first).to have_key(:address)
      expect(results.first).to have_key(:position)
    end
  end
end
