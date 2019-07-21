require 'rails_helper'

describe 'A logged in user' do
  before :each do
    @user = create(:user)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)
    @landmark = create(:landmark)
    @recording = create(:recording, landmark: @landmark)
    @id = @landmark.id
    @score = 1
    @votable_type = "Recording"

  end

  it 'can add a vote to a specific location' do
    visit "landmark_recordings_path(#{@id})"

    expect(page).to have_content("Total Rating:")
    expect(page).to have_content("Upvotes:")
    expect(page).to have_content("Downvotes:")

    select "1", from: :vote

    click_button "Submit Vote"

    expect(current_path).to eq(submit_landmark_vote)

    endpoint = "/api/v1/#{@votable_type}/#{@id}/#{{@score}}"

  end
end
