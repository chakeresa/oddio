require 'rails_helper'

RSpec.describe "Tour Show Page" do
  describe 'as a visitor' do
    before(:each) do
      @tour = create(:tour)
      r1, r2 = create_list(:recording, 2)
      tr1 = create(:tour_recording, tour: @tour, recording: r1)
      tr2 = create(:tour_recording, tour: @tour, recording: r2)
    end
    
    it 'loads the page' do
      VCR.use_cassette('tour_show_page_loads', record: :new_episodes) do
        visit tour_path(@tour)

        expect(current_path).to eq(tour_path(@tour))
        expect(status_code).to eq(200)
      end
    end
    
    it 'lists basic data and all recordings' do
      VCR.use_cassette('tour_show_page_data_and_recordings', record: :new_episodes) do
        visit tour_path(@tour)

        expect(page).to have_content(@tour.title)
        expect(page.all('.recording-list').count).to eq(2)

        within(first('.recording-list')) do
          recording = @tour.recordings.first
          expect(page).to have_content(recording.title)
          expect(page).to have_link(recording.user.display_name, href: user_path(recording.user))
          expect(page.all('audio').count).to eq(1)
        end
      end
    end

    xit 'shows a map of the relevant locations'
  end
end
