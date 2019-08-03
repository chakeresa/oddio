require 'rails_helper'

RSpec.describe 'tour list show', :vcr, type: :feature do

  let(:user) { create(:user) }
  let(:landmark1) { create(:landmark) }
  let(:landmark2) { create(:landmark) }
  let(:landmark3) { create(:landmark) }

  context 'as a visitor,' do
    scenario 'unable to visit the page' do
      visit tour_list_path

      expect(page.status_code).to eq(404)
    end
  end

  context 'as a user,' do
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

    scenario 'sees their tour list' do
      within("#landmark-#{landmark1.id}") do
        expect(page).to have_content(landmark1.name)
      end

      within("#landmark-#{landmark2.id}") do
        expect(page).to have_content(landmark2.name)
      end

      within("#landmark-#{landmark3.id}") do
        expect(page).to have_content(landmark3.name)
      end
    end

    scenario 'can empty their tour list' do
      click_on 'Empty List'

      expect(current_path).to eq(tour_list_path)
      expect(page).to have_content('Create Tour(0)')
      expect(page).to have_content("There are no landmarks currently in your tour list.")
      expect(page).to_not have_button("Empty List")
    end

    scenario 'can remove an landmark from their tour list' do
      within("#landmark-#{landmark3.id}") do
        click_button('Remove')
      end

      expect(current_path).to eq(tour_list_path)
      expect(page).to have_css("#landmark-#{landmark1.id}")
      expect(page).to have_css("#landmark-#{landmark2.id}")
      expect(page).to_not have_css("#landmark-#{landmark3.id}")
      expect(page).to have_content("#{landmark3.name} has been removed from your tour list.")
    end
  end

  context 'as an admin,'

  context 'edge case' do
    scenario 'user sees message if there are no landmarks in tour list' do
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit tour_list_path

      expect(page).to have_content('There are no landmarks currently in your tour list.')
    end
  end
end
