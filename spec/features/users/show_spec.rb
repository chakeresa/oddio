require 'rails_helper'

feature 'user show page' do
  describe 'as a visitor' do
    before(:each) do
      @user = create(:user)
      create_list(:recording, 2, user: @user)

      visit user_path(@user)
    end

    it 'shows all recordings for one content creator' do
      expect(page).to have_content(@user.display_name)
      expect(page.all('.recording-list').count).to eq(2)

      within(first('.recording-list')) do
        recording = @user.recordings.first
        expect(page).to have_content(recording.title)
        expect(page).to have_link(recording.landmark.name, href: landmark_path(recording.landmark))
      end
    end
  end
end
