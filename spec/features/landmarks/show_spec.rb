require 'rails_helper'

feature 'landmark show' do
  describe 'as a visitor' do
    it "lets me open directions to the location in google maps" do
      landmark = Create(:landmark, lat: 0.3973717e2, long: -0.10499001e3, name: "Byers-Evans House Museum", address: "1310 Bannock St, Denver, CO 80204", phone_number: "+(1)-(303)-6204933", category: "museum")

      click_link("Open in Maps")
    end
  end
end
