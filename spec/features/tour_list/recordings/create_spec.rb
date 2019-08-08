require 'rails_helper'

RSpec.describe 'tour list recordings create', :vcr, type: :feature do

  let(:user) { create(:user) }
  let(:landmark1) { create(:landmark) }
  let(:landmark2) { create(:landmark) }
  let(:landmark3) { create(:landmark) }

  context 'as a visitor' do
    scenario 'unable to visit the page' do
      visit tour_list_path

      expect(page.status_code).to eq(404)
    end
  end

  context 'as a user' do
    before :each do
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit landmark_path(landmark1)
      click_button 'Add to tour list'
      visit landmark_path(landmark2)
      click_button 'Add to tour list'
      visit landmark_path(landmark3)
      click_button 'Add to tour list'

      visit tour_list_path
    end

    scenario 'can add recording to landmark' do
      expect(page).to have_button('Upload Recording')

      within("#landmark-#{landmark1.id}") do
        click_on 'Upload Recording'
      end

      expect(current_path).to eq(new_tour_list_landmark_recording_path(landmark1))
    end
  end

  context 'as an admin'

  context 'edge case'
end
