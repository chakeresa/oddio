require 'rails_helper'

feature 'Visitor can search landmarks' do
  scenario 'with name of city' do
    VCR.use_cassette('visitor_search_by_city') do
      visit landmarks_path

      fill_in :query, with: 'Denver'
      click_on 'Search'

      expect(current_path).to eq('/landmarks')

      within(first('.landmark_results')) do
        expect(page).to have_css('.landmark_name')
        expect(page).to have_css('.landmark_rating')
        expect(page).to have_css('.landmark_types')
        expect(page).to have_css('.landmark_lat')
        expect(page).to have_css('.landmark_lng')
        expect(page).to have_css('.landmark_place_id')
      end
    end
  end
end

# As a visitor / user / admin,
# When I visit the landmark index,
# I see a map of the area around my IP address’ location with pins for landmarks (??)
# I see a box for me to enter the search location.
# When I enter a location (zip code, address, etc),
# And I click “Search”,
# I see a map with pins for landmarks around the desired location.
