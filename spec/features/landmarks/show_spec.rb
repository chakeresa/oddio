require 'rails_helper'

feature 'landmark show' do
  describe 'as a visitor' do
    let(:landmark) { Landmark.create(
      name: 'Governors Park',
      address: '701 Pennsylvania St, Denver, CO 80203, USA',
      phone_number: '(720) 913-1311',
      category: 'park',
      lat: 39.727706,
      long: -104.981784,
      website: 'https://www.denvergov.org/content/denvergov/en/denver-parks-and-recreation.html',
      place_id: 'ChIJISHlw9l-bIcRl-J_-5IVSN8',
      photo_reference: 'CmRaAAAA0DaL7ahs9-s43r1B5UgJDfY-PWSTiU4IaIGZXneIhnL9VoLasfdjb8uILVT2fpv3itbylY_ag0rfjDCNkgQfX7BbukpZYFyZkcyxt5QzpS4T-0jsU6i-yukAWcoplJ79EhAuUtUH8AmRk8vestSiHYHBGhR1RIVab8DqQ39GMus178M4aHepwQ'
    ) }

    it "displays the landmarks info" do
      visit landmark_path(landmark)

      expect(page).to have_all_of_selectors(".picture", ".attributes", ".map")
      expect(page).to have_content(landmark.name)
      expect(page).to have_content(landmark.address)
      expect(page).to have_content(landmark.phone_number)
      expect(page).to have_content(landmark.category)
    end

    it "doesn't display add new recording button" do
      visit landmark_path(landmark)

      expect(page).to_not have_button('Upload new recording')
    end

  end

  describe 'as a user' do
  end

  describe 'as an admin' do
  end
end
