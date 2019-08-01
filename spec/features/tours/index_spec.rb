require 'rails_helper'

RSpec.describe "Tours Index" do
  describe 'as a visitor' do
    before(:each) do
      @tours = create_list(:tour, 2)
    end
    
    it 'loads the page' do
      VCR.use_cassette('tours_index/visitor_loads_page', record: :new_episodes) do
        visit tours_path

        expect(current_path).to eq(tours_path)
        expect(status_code).to eq(200)
      end
    end
    
    it 'lists all tours' do
      VCR.use_cassette('tours_index/visitor_sees_all_tours', record: :new_episodes) do
        visit tours_path

        expect(page).to have_content('All Tours')
        expect(page.all('.tour-list').count).to eq(2)

        within(first('.tour-list')) do
          tour = @tours.first
          expect(page).to have_link(tour.title, href: tour_path(tour))
          expect(page).to have_link(tour.user.display_name, href: user_path(tour.user))
        end
      end
    end
  end
end
