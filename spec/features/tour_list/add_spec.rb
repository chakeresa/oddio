require 'rails_helper'

RSpec.describe 'tour list add landmarks', :vcr, type: :feature do

  let(:user) { create(:user) }
  let(:landmark1) { create(:landmark) }
  let(:landmark2) { create(:landmark) }
  let(:landmark3) { create(:landmark) }

  context 'as a visitor' do
    scenario 'unable to see create tour display' do
      visit landmarks_path

      expect(page).to_not have_content('Create Tour(0)')
    end
  end

  context 'as a user' do
    before :each do
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
    end

    scenario 'displays a message when you add landmark to tour list' do
      visit landmark_path(landmark1)

      within('.add-tour-list') do
        click_button 'Add to tour list'
      end

      expect(page).to have_content("You have added #{landmark1.name} to your tour list.")
    end

    scenario 'can add multiple landmarks to tour list' do
      visit landmark_path(landmark1)

      click_button 'Add to tour list'

      expect(page).to have_content("You have added #{landmark1.name} to your tour list. You have 1 landmark(s) in your tour list.")

      visit landmark_path(landmark2)

      click_button 'Add to tour list'

      expect(page).to have_content("You have added #{landmark2.name} to your tour list. You have 2 landmark(s) in your tour list.")

      visit landmark_path(landmark3)

      click_button 'Add to tour list'

      expect(page).to have_content("You have added #{landmark3.name} to your tour list. You have 3 landmark(s) in your tour list.")
    end

    scenario 'displays the total number of landmarks in the tour list' do
      visit landmark_path(landmark1)

      expect(page).to have_content('Create Tour(0)')

      click_button 'Add to tour list'

      expect(page).to have_content('Create Tour(1)')

      visit landmark_path(landmark2)

      click_button 'Add to tour list'

      expect(page).to have_content('Create Tour(2)')

      visit landmark_path(landmark3)

      click_button 'Add to tour list'

      expect(page).to have_content('Create Tour(3)')
    end
  end

  context 'as a admin'

  context 'edge case' do
    scenario 'user unable to add same landmark' do
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit landmark_path(landmark1)

      click_button 'Add to tour list'

      expect(page).to have_content("You have added #{landmark1.name} to your tour list. You have 1 landmark(s) in your tour list.")

      visit landmark_path(landmark1)

      click_button 'Add to tour list'

      expect(page).to have_content("You already have #{landmark1.name} in your tour list")
    end
  end
end
