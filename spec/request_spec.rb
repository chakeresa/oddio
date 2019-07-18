require 'rails_helper'

describe 'Landmarks API' do
  it 'sends multiple landmarks' do
    tutorial1 = create(:tutorial)
    video1 = create(:video, tutorial_id: tutorial1.id)

    get "/api/v1/videos/#{video1.id}"

    expect(response).to be_successful

    parsed = JSON.parse(response.body, symbolize_names: true)

    expect(parsed[:id]).to eq(video1.id)
  end
end
