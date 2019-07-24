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

    within(page.all(".total-score")) do
      expect(page).to have_content(1)
    end

#go to controller with sintra in there instead of going to
#instead of vote.create
#use a background worker


    # endpoint = get "/api/v1/#{@votable_type}/#{@id}/#{{@score}}"

    #add part in registration spec that tests whether or not vote token is created
  end
end
