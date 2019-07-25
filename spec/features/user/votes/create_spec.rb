require 'rails_helper'

describe 'A logged in user' do
  before :each do
    @user = create(:user)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)
    @landmark = create(:landmark)
    @recording = create(:recording, landmark: @landmark, user: @user)
  end

  xit 'can add a vote to a specific landmarks recording' do
    VCR.use_cassette('user_creates_recording_vote', record: :new_episodes) do

      visit landmark_path(@landmark.id)

      within(".total-score") do
        expect(page).to have_content("Rating: 0")
      end

      within(".up-vote") do
        click_button "Up"
      end

      expect(current_path).to eq(landmark_path(@landmark.id))

      within(".total-score") do
        expect(page).to have_content("Rating: 1")
      end
    end
  end

  it 'can add a vote to a specific landmarks recording' do
    VCR.use_cassette('user_creates_vote_landmark', record: :new_episodes) do

      visit landmark_path(@landmark.id)

      within(".landmark-total-score") do
        expect(page).to have_content("Landmark's Rating: 0")
      end

      within(".landmark-up-vote") do
        click_button "Up"
      end

      expect(current_path).to eq(landmark_path(@landmark.id))

      within(".landmark-total-score") do
        expect(page).to have_content("Landmark's Rating: 1")
      end
    end
  end
end
