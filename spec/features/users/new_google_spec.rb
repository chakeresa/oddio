require 'rails_helper'

RSpec.describe 'Registering a new user through Google OAuth' do
  it 'creates a user' do
    mock_oauth

    visit new_user_path
    click_link 'Login with Google'

    expect(current_path).to eq(landmarks_path)
    expect(User.count).to eq(1)
    
    expect(page).to have_content("Welcome, #{'sdlfjadkfjal'}!")
    expect(page).to have_link('Log Out')
    expect(page).to_not have_link('Login')
    expect(page).to_not have_link('Register')

    OmniAuth.config.mock_auth[:google_oauth2] = nil
  end
end
