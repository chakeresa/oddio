require 'rails_helper'

feature 'landmark index' do
  it 'shows a list of recommended tours' do
    create_list(:landmark, 2)
    tours = create_list(:tour, 3)
    
    visit landmarks_path

    expect(page.all('.tour-list').count).to eq(3)

    within(first('.tour-list')) do
      tour = tours.first
      expect(page).to have_link(tour.title, href: tour_path(tour))
    end
  end
end
