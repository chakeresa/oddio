require 'rails_helper'

RSpec.describe "Tourlist Create", vcr: :new_episodes do
  describe 'as a user' do
    before(:each) do
      @user = create(:user)
      @landmark1 = create(:landmark)
      @landmark2 = create(:landmark)
      @landmark3 = create(:landmark)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)
    end

    it 'displays a message when you add landmark to tour list' do
      visit landmark_path(@landmark1)

      within(".attributes") do
        click_button "Add to tour"
      end

      expect(page).to have_content("You have added #{@landmark1.name} to your tour list.")
    end

    it 'can add multiple landmarks to tour list' do
      visit landmark_path(@landmark1)
      click_button "Add to tour"
      expect(page).to have_content("You have added #{@landmark1.name} to your tour list.")
      expect(page).to have_content("You have 1 landmarks in your tour list.")

      visit landmark_path(@landmark2)
      click_button "Add to tour"
      expect(page).to have_content("You have added #{@landmark2.name} to your tour list.")
      expect(page).to have_content("You have 2 landmarks in your tour list.")

      visit landmark_path(@landmark3)
      click_button "Add to tour"
      expect(page).to have_content("You have added #{@landmark3.name} to your tour list.")
      expect(page).to have_content("You have 3 landmarks in your tour list.")
    end

    it "displays the total number of landmarks in the tour list" do
      visit landmark_path(@landmark1)

      expect(page).to have_content("Create Tour(0)")

      click_button "Add to tour"

      expect(page).to have_content("Create Tour(1)")

      visit landmark_path(@landmark2)
      click_button "Add to tour"

      expect(page).to have_content("Create Tour(2)")

      visit landmark_path(@landmark3)
      click_button "Add to tour"

      expect(page).to have_content("Create Tour(3)")
    end
  end
end
