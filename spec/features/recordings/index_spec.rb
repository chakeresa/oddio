require 'rails_helper'

feature 'recordings index page', :vcr do
  before(:each) do
    @recordings = create_list(:recording, 2)
  end

  describe 'as a visitor' do
    it 'shows all recordings' do
      VCR.use_cassette('visitor_sees_recording', record: :new_episodes) do
        visit recordings_path
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

    it 'the vote arrows dont display' do
      visit recordings_path

      expect(page).to_not have_content('▲')
      expect(page).to_not have_content('▼')
    end
  end

  describe 'as a user' do
    let(:user) { create(:user) }

    it 'the vote arrows display' do
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit recordings_path

      expect(page).to have_content('▲')
      expect(page).to have_content('▼')
    end

    it "has a button to flag content" do
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
      visit recordings_path
      expect(@recordings.first.flags.count).to eq(0)
      within(first('.recording-list')) do
        click_button("⚑")
      end
      expect(@recordings.first.flags.count).to eq(1)
      expect(page).to have_content("Thanks for your report!")
      within(first('.recording-list')) do
        click_button("⚑")
      end
      expect(@recordings.first.flags.count).to eq(1)
      expect(page).to_not have_content("Thanks for your report!")
    end
  end
end
