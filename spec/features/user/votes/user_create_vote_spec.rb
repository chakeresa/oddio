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

  it 'can add a vote to a specific landmarks recording' do
    WebMock.allow_net_connect!
    VCR.turn_off!
    visit landmark_path(@id)

    within(".up-vote") do
      find('.upvote').click
    end

    expect(current_path).to eq(landmark_path(@id))

    within(page.all(".attributes")) do
      expect(page).to have_content("Landmark Score: 1")
    end
  end
end
