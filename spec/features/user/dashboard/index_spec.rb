require 'rails_helper'

feature 'user dashboard', :vcr do
  before :each do
    @user1 = create(:user)

    @landmark = Landmark.create(
      name: 'Governors Park',
      address: '701 Pennsylvania St, Denver, CO 80203, USA',
      phone_number: '(720) 913-1311',
      category: 'park',
      lat: 39.727706,
      long: -104.981784,
      website: 'https://www.denvergov.org/content/denvergov/en/denver-parks-and-recreation.html',
      place_id: 'ChIJISHlw9l-bIcRl-J_-5IVSN8',
      photo_reference: 'CmRaAAAA0DaL7ahs9-s43r1B5UgJDfY-PWSTiU4IaIGZXneIhnL9VoLasfdjb8uILVT2fpv3itbylY_ag0rfjDCNkgQfX7BbukpZYFyZkcyxt5QzpS4T-0jsU6i-yukAWcoplJ79EhAuUtUH8AmRk8vestSiHYHBGhR1RIVab8DqQ39GMus178M4aHepwQ'
    )

    @recording1 = create(:recording, user: @user1, landmark: @landmark)
    @recording2 = create(:recording, user: @user1, landmark: @landmark)
    @recording3 = create(:recording, user: @user1, landmark: @landmark)
  end

  describe 'as a visitor' do
    it 'unable to visit the page' do
      visit user_dashboard_path

      expect(page.status_code).to eq(404)
    end
  end

  describe 'as a user' do
    it 'it displays their recordings' do
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user1)

      visit user_dashboard_path

      expect(current_path).to eq(user_dashboard_path)
      expect(page).to have_css('.user-recordings')
      expect(page).to have_css('.recording-list', count: 3)
      expect(page).to have_content("#{@user1.display_name}'s Dashboard")

      within(first('.recording-list')) do
        expect(page).to have_content(@recording1.title)
        expect(page).to have_link(@landmark.name, href: landmark_path(@landmark))
        expect(page.all('audio').count).to eq(1)

        click_on @landmark.name
        expect(current_path).to eq(landmark_path(@landmark))
      end
    end

    it 'can delete a recording' do
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user1)

      visit user_dashboard_path

      within(first('.recording-list')) do
        expect(page).to have_button('Delete')
        click_button 'Delete'
      end

      expect(current_path).to eq(user_dashboard_path)
      expect(page).to have_css('.recording-list', count: 2)
      expect(@landmark.recordings.count).to eq(2)
    end
  end

  describe 'as a admin' do
    let(:admin) { create(:admin) }

    it 'sees users information' do
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

      visit admin_path(@user1)

      expect(page).to have_content(@user1.display_name)
      expect(page.all('.recording-list').count).to eq(3)

      within(first('.recording-list')) do
        expect(page).to have_content(@recording1.title)
        expect(page).to have_link(@landmark.name, href: landmark_path(@landmark))
        expect(page.all('audio').count).to eq(1)
      end
    end

    it 'can delete recording' do
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

      visit admin_path(@user1)

      within(first('.recording-list')) do
        expect(page).to have_button('Delete')
        click_button 'Delete'
      end

      expect(current_path).to eq(admin_path(@user1))
      expect(page).to have_css('.recording-list', count: 2)
      expect(@landmark.recordings.count).to eq(2)
    end
  end

  describe 'edge case' do
    let(:user2) { create(:user) }

    it 'user cannot delete another users recording' do
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user1)

      visit user_dashboard_path

      @recording1.update(user: user2)

      within(first('.recording-list')) do
        click_button 'Delete'
      end
      expect(page).to have_content("That recording cannot be deleted")
    end
  end
end
