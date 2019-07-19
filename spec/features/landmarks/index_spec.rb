require 'rails_helper'

feature 'landmark index' do
  describe 'as a visitor' do
    xit 'I can search landmarks with name of city' do
      VCR.use_cassette('visitor_search_by_city') do
        visit landmarks_path

        fill_in :query, with: 'Tucson'
        click_on 'Search'

        expect(current_path).to eq('/landmarks')

        expect(page).to have_css('.landmark_results', count: 25)

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

    xit 'I can search landmarks by zipcode'
    xit 'I can search landmarks by address'
  end

  describe 'as a user' do
    xit 'I can search landmarks with name of city'
    xit 'I can search landmarks by zipcode'
    xit 'I can search landmarks by address'
  end

  describe 'as an admin' do
    xit 'I can search landmarks with name of city'
    xit 'I can search landmarks by zipcode'
    xit 'I can search landmarks by address'
  end
end

# As a visitor / user / admin,
# When I visit the landmark index
# When I enter a location (zip code, address, etc),
# And I click “Search”,
# I see a map with pins for landmarks around the desired location.
