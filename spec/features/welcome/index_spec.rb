require 'rails_helper'

RSpec.describe "Welcome Index" do
  describe 'as a visitor' do
    before(:each) do
      visit '/'
    end

    it 'loads the page' do
      expect(current_path).to eq(root_path)
      expect(status_code).to eq(200)
    end

    it 'shows basic info about the site' do
      expect(page).to have_content('Welcome to Oddio')
    end

    it 'has links to register and login' do
      expect(page).to have_link('Register')
      expect(page).to have_selector(:css, "a[href=\"#{register_path}\"]")

      expect(page).to have_link('Login')
      expect(page).to have_selector(:css, "a[href=\"#{login_path}\"]")
    end

    it "has a link to the map do" do
      save_and_open_page
      click_link("Start Exploring")
      expect(current_path).to eq(landmarks_path)
    end

    it "has a link to tours page" do
      click_link("Premade Tours")
      expect(current_path).to eq(tours_path)
    end
  end
end
