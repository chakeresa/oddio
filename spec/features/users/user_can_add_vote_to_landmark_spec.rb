require 'rails_helper'

describe 'A logged in user' do
  before :each do
    @user = create(:user)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)
    @landmark = create(:landmark)
    @recording = create(:recording, landmark: @landmark, user: @user)
    @id = @landmark.id
    @score = 1
    @votable_type = "Recording"

  end

  it 'can add a vote to a specific location' do
    visit landmark_path(@id)

    within(page.first(".recording-list")) do
      find('button.upvote').click
    end

    within(page.first(".recording-list")) do
      expect(page).to have_content(1)
    end




    # endpoint = get "/api/v1/#{@votable_type}/#{@id}/#{{@score}}"
  end
end
