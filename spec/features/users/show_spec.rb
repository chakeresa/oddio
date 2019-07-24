require 'rails_helper'

feature 'user show page' do
  describe 'as a visitor' do
    before(:each) do
      @user = create(:user)
      create_list(:recording, 2, user: @user)
      create_list(:tour, 2, user: @user)

      visit user_path(@user)
    end

    it 'shows all recordings for one content creator' do
      expect(page).to have_content(@user.display_name)
      expect(page.all('.recording-list').count).to eq(2)

      within(first('.recording-list')) do
        recording = @user.recordings.first
        expect(page).to have_content(recording.title)
        expect(page).to have_link(recording.landmark.name, href: landmark_path(recording.landmark))
        expect(page.all('audio').count).to eq(1)
      end
    end

    it 'shows a message if there are no recordings' do
      user = create(:user)
      visit user_path(user)

      expect(page).to have_content('Recordings')
      expect(page).to have_content('No recordings uploaded yet')
    end

    it 'shows all tours for one content creator' do
      expect(page.all('.tour-list').count).to eq(2)

      within(first('.tour-list')) do
        tour = @user.tours.first
        expect(page).to have_link(tour.title, href: tour_path(tour))
      end
    end

    it 'shows a message if there are no tours' do
      user = create(:user)
      visit user_path(user)

      expect(page).to have_content('Tours')
      expect(page).to have_content('No tours hosted yet')
    end
  end
end
