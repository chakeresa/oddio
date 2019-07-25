require 'rails_helper'

describe 'A logged in user' do
  before :each do
    @user = create(:user)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)
    @landmark = create(:landmark)
    @recording = create(:recording, landmark: @landmark, user: @user)
  end

  it 'can only create vote for a landmarks recording once.' do
    # VCR.use_cassette('user_only_votes_once', record: :new_episodes) do
      WebMock.allow_net_connect!
      VCR.turn_off!
      visit landmark_path(@landmark.id)

      within(".up-vote") do
        click_button "Up"
      end

      within(".total-score") do
        expect(page).to have_content("Rating: 1")
      end


      within(".down-vote") do
        click_button "Down"
      end

      within(".total-score") do
        expect(page).to have_content("Rating: 0")
      end

      within(".up-vote") do
        click_button "Up"
      end


      within(".up-vote") do
        click_button "Up"
      end

      within(".total-score") do
        expect(page).to have_content("Rating: 1")
        expect(page).to_not have_content("Rating: 2")
      end


    # end
  end
end
