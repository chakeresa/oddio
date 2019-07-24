require 'rails_helper'

feature 'landmark show', :vcr do
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

  let(:user) { create(:user) }
  let(:landmark2) { create(:landmark) }

  describe 'as a visitor' do
    it "displays the landmarks info" do
      visit landmark_path(landmark)

      expect(page).to have_all_of_selectors(".attributes", ".map")
      expect(page).to have_content(landmark.name)
      expect(page).to have_content(landmark.address)
      expect(page).to have_content(landmark.phone_number)
      expect(page).to have_content(landmark.category)
      expect(page).to have_link(nil, href: "#{landmark.website}")
    end

    it "doesn't display add new recording button" do
      visit landmark_path(landmark)

      expect(page).to_not have_button('Upload new recording')
    end
<<<<<<< HEAD
=======

    it 'has a list of recordings for the landmark' do
      create(:recording)
      landmark2 = create(:landmark)
      recordings = create_list(:recording, 2, landmark: landmark2)
      visit landmark_path(landmark2)

      expect(page.all('.recording-list').count).to eq(2)

      within(first('.recording-list')) do
        recording = recordings.first
        expect(page).to have_content(recording.title)
        expect(page).to have_link(recording.user.display_name, href: user_path(recording.user))
        expect(page.all('audio').count).to eq(1)
      end
    end
>>>>>>> 75b46aee16f8431b4b28d085c1b4ff06652e9983
  end

  describe 'as a user' do
    it "displays the landmarks info" do
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit landmark_path(landmark)

      expect(page).to have_all_of_selectors(".attributes", ".map")
      expect(page).to have_content(landmark.name)
      expect(page).to have_content(landmark.address)
      expect(page).to have_content(landmark.phone_number)
      expect(page).to have_content(landmark.category)
    end

    it "displays add new recording button" do
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit landmark_path(landmark)

      within(".add-recordings") do
        expect(page).to have_button('Upload new recording')
        click_on 'Upload new recording'
<<<<<<< HEAD
        expect(current_path).to eq(new_landmark_recording_path(landmark))
=======
        expect(current_path).to eq(new_user_landmark_recording_path(landmark))
>>>>>>> 75b46aee16f8431b4b28d085c1b4ff06652e9983
      end
    end
  end

  describe 'as an admin' do

  end

  describe 'edge cases' do
    it "landmark doesn't have website" do
      landmark2.update(website: nil)

      visit landmark_path(landmark2)

      within(".attributes") do
        expect(page).to have_content("Website: Not Available")
      end
    end

    it "landmark doesn't have phone number" do
      landmark2.update(phone_number: nil)

      visit landmark_path(landmark2)

      within(".attributes") do
        expect(page).to have_content("Phone: Not Available")
      end
    end
  end
end
