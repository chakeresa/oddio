require 'rails_helper'

RSpec.describe 'Registering a new user through Google OAuth' do
  it 'creates a user after entering a unique username' do
    mock_oauth

    display_name = 'bobthepersonfromgoogle'

    visit register_path
    click_link 'Login with Google'

    expect(GoogleAuth.count).to eq(1)
    expect(User.count).to eq(0)
    
    fill_in 'user[display_name]', with: display_name
    click_button("Let's Get Started")
    
    expect(current_path).to eq(landmarks_path)
    expect(User.count).to eq(1)
    expect(GoogleAuth.last.user.id).to eq(User.last.id)

    user = User.last
    expect(user.first_name).to eq('Alexandra')
    expect(user.last_name).to eq('Chakeres')
    expect(user.email).to eq('alexchakeres@gmail.com')
    
    expect(page).to have_content("Welcome, Alexandra!")
    expect(page).to have_link('Log Out')
    expect(page).to have_selector(:css, "a[href=\"#{ logout_path }\"]")
    expect(page).to_not have_link('Login')
    expect(page).to_not have_link('Register')

    OmniAuth.config.mock_auth[:google_oauth2] = nil
  end
end
