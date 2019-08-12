require 'rails_helper'

RSpec.describe 'tour list recordings', :vcr, type: :feature do

  let(:user) { create(:user) }
  let(:landmark) { create(:landmark) }

  context 'as a visitor' do
    scenario 'unable to see tour list landmarks recordings' do
      visit tour_list_landmark_recordings_path(landmark)

      expect(page.status_code).to eq(404)
    end
  end

  context 'as a user' do
    before :each do
      recording = create(:recording, landmark: landmark)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit landmark_path(landmark)
      click_button 'Add to tour list'

      visit tour_list_path
    end

    scenario 'can select existing recording' do
      expect(page).to have_button('Choose Existing Recording')

      within("#landmark-#{landmark.id}") do
        click_on 'Choose Existing Recording'
      end

      expect(current_path).to eq(tour_list_landmark_recordings_path(landmark))

      within(first('.recording-list')) do
        click_on 'Pick Recording'
      end

      expect(current_path).to eq(tour_list_path)
      expect(page).to have_content('The recording has been saved.')
    end
  end

  context 'as an admin'

  context 'edge case' do
    scenario 'user can change recording that was selected' do
      recording = create(:recording, landmark: landmark)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
      visit landmark_path(landmark)
      click_button 'Add to tour list'
      visit tour_list_path

      within("#landmark-#{landmark.id}") do
        click_on 'Choose Existing Recording'
      end

      within(first('.recording-list')) do
        click_on 'Pick Recording'
      end

      click_on 'Select A Different Recording'

      expect(current_path).to eq(tour_list_path)
      expect(page).to have_content('The recording has been removed from the tour list.')
    end
  end
end
