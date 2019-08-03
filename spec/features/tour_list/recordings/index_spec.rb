require 'rails_helper'

RSpec.describe 'tour list recordings', :vcr, type: :feature do

  let(:user) { create(:user) }
  let(:landmark) { create(:landmark) }

  context 'as a visitor,' do
    scenario 'unable to see tour list landmarks recordings' do
      visit tour_list_landmark_recordings_path(landmark)

      expect(page.status_code).to eq(404)
    end
  end

  context 'as a user,' do
    before :each do
      r1, r2 = create_list(:recording, 2, landmark: landmark)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit landmark_path(landmark)
      click_button 'Add to tour list'

      visit tour_list_path
    end

    scenario 'can click pick existing recording button' do
      expect(page).to have_button('Pick Existing Recording')

      within("#landmark-#{landmark.id}") do
        click_on 'Pick Existing Recording'
      end

      expect(current_path).to eq(tour_list_landmark_recordings_path(landmark))
    end
  end
end
