require 'rails_helper'

RSpec.describe 'Registering a new user through Google OAuth' do
  it 'creates a user after entering a unique username' do
    mock_oauth

    username = 'bobthepersonfromgoogle'

    visit register_path
    click_link 'Login with Google'

    expect(User.count).to eq(1)
    expect(current_path).to eq(edit_google_user_path(User.first))

    fill_in 'username', with: username
    click_button('Register')

    expect(current_path).to eq(landmarks_path)
    expect(User.first.username).to eq(username)
    
    expect(page).to have_content("Welcome, #{'sdlfjadkfjal'}!")
    expect(page).to have_link('Log Out')
    expect(page).to_not have_link('Login')
    expect(page).to_not have_link('Register')

    OmniAuth.config.mock_auth[:google_oauth2] = nil
  end
end
