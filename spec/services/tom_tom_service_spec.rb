require "rails_helper"

RSpec.describe TomTomService do
  let(:service) { TomTomService.new }
  let(:category) { {categorySet: 7317} }

  it 'exist' do
    expect(service).to be_a TomTomService
  end

  it "#category_search returns landmarks when given a category set" do
    VCR.use_cassette('tomtom_service_category_search_instance_method') do
      results = service.category_search(category)

      expect(results.class).to eq(Array)
      expect(results.first).to have_key(:poi)
      expect(results.first[:poi]).to have_key(:name)
      expect(results.first[:poi]).to have_key(:categorySet)
      expect(results.first[:poi][:categorySet].first[:id]).to eq(category[:categorySet])
    end
  end

  it "::category_search returns landmarks when given a category set" do
    VCR.use_cassette('tomtom_service_category_search_class_method') do
      results = TomTomService.category_search(category)

      expect(results.class).to eq(Array)
      expect(results.first).to have_key(:poi)
      expect(results.first[:poi]).to have_key(:name)
      expect(results.first[:poi]).to have_key(:categorySet)
      expect(results.first[:poi][:categorySet].first[:id]).to eq(category[:categorySet])
    end
  end
end
