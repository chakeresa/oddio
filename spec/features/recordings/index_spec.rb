require 'rails_helper'

feature 'recordings index page' do
  describe 'as a visitor' do
    before(:each) do
      @recordings = create_list(:recording, 2)

      visit recordings_path
    end

    it 'shows all recordings' do
      expect(page).to have_content('All Recordings')
      expect(page.all('.recording-list').count).to eq(2)

      within(first('.recording-list')) do
        recording = @recordings.first
        expect(page).to have_content(recording.title)
        expect(page).to have_link(recording.user.display_name, href: user_path(recording.user))
        expect(page).to have_link(recording.landmark.name, href: landmark_path(recording.landmark))
        expect(page.all('audio').count).to eq(1)
      end
    end
  end
end
