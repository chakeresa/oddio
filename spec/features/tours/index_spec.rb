require 'rails_helper'

RSpec.describe "Tours Index" do
  describe 'as a visitor' do
    before(:each) do
      @tours = create_list(:tour, 2)
      visit tours_path
    end

    it 'loads the page' do
      expect(current_path).to eq(tours_path)
      expect(status_code).to eq(200)
    end

    it 'lists all tours' do
      expect(page).to have_content('All Tours')
      expect(page.all('.tour-list').count).to eq(2)

      within(first('.tour-list')) do
        tour = @tours.first
        expect(page).to have_link(tour.title, url: tour_path(tour))
        expect(page).to have_link(tour.user.display_name, href: user_path(tour.user))
      end
    end
  end
end
