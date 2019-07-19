require "rails_helper"

describe 'Visitor can enable location services' do
  it "allows user to allow location services" do
    visit landmarks_path
    click_button("Use my Location")
    expect(current_path).to eq(landmarks_path)
    #Expect location to center on your location
    end
  end
