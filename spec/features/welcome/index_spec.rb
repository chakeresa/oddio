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
      # TODO: Issue #16 - Add brief description of the site & sample content
      expect(page).to have_link('I want to explore')
      expect(page).to have_selector(:css, "a[href=\"#{landmarks_path}\"]")

      expect(page).to have_link('Take me on a Recommended Tour')
      expect(page).to have_selector(:css, "a[href=\"#{tours_path}\"]")
    end

    it 'has links to register and login' do
      expect(page).to have_link('Register')
      expect(page).to have_selector(:css, "a[href=\"#{register_path}\"]")

      expect(page).to have_link('Login')
      expect(page).to have_selector(:css, "a[href=\"#{login_path}\"]")
    end
  end
end
