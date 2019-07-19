require 'rails_helper'

feature 'landmark show' do
  describe 'as a visitor' do
    it "lets me open directions to the location in google maps" do
      landmark = land

      click_link("Open in Google maps")
    end
  end
end
