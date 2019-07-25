require 'rails_helper'

feature 'tour landmark show page', :vcr do
  describe 'as a visitor' do
    before(:each) do
      @tour = create(:tour)
      @landmark = create(:landmark)
      @recording = create(:recording, landmark: @landmark)
      create(:recording, landmark: @landmark)
      create(:tour_recording, tour: @tour, recording: @recording)
    end

    it "displays the landmark's info" do
      visit tour_landmark_path(@tour, @landmark)

      expect(page).to have_all_of_selectors(".attributes", ".map")
      expect(page).to have_content(landmark.name)
      expect(page).to have_content(landmark.address)
      expect(page).to have_content(landmark.phone_number)
      expect(page).to have_content(landmark.category)
      expect(page).to have_link(nil, href: "#{landmark.website}")
    end

    it "doesn't display add new recording button" do
      visit tour_landmark_path(@tour, @landmark)

      expect(page).to_not have_button('Upload new recording')
    end

    it 'has a list of recordings for the tour/landmark' do
      tour_landmark_path(@tour, @landmark)

      expect(page.all('.recording-list').count).to eq(1)

      within(first('.recording-list')) do
        expect(page).to have_content(@recording.title)
        expect(page).to have_link(@recording.user.display_name, href: user_path(@recording.user))
        expect(page.all('audio').count).to eq(1)
      end
    end
  end
end
