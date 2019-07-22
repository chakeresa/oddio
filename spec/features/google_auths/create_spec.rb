require 'rails_helper'

RSpec.describe 'Google OAuth' do
  it 'creates a user after entering a unique display_name' do
    mock_oauth

    display_name = 'bobthepersonfromgoogle'

    visit register_path
    click_button 'Login with Google'

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

  it 'does not create a new user after entering a duplicate display_name' do
    mock_oauth

    display_name = 'bobthepersonfromgoogle'

    create(:user, display_name: display_name)

    visit register_path
    click_button 'Login with Google'

    expect(GoogleAuth.count).to eq(1)
    expect(User.count).to eq(1)
    
    fill_in 'user[display_name]', with: display_name
    click_button("Let's Get Started")
    
    expect(page).to have_content('Display name has already been taken')
    expect(page).to have_field('user[display_name]')

    expect(User.count).to eq(1)
    expect(GoogleAuth.last.user).to be_nil

    OmniAuth.config.mock_auth[:google_oauth2] = nil
  end

  it "doesn't error out when you revisit the page" do
    mock_oauth

    display_name = 'bobthepersonfromgoogle'

    visit register_path
    click_button 'Login with Google'

    expect(GoogleAuth.count).to eq(1)
    expect(User.count).to eq(0)
    
    visit register_path
    click_button 'Login with Google'

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
  
  it 'logs in an existing user' do
    mock_oauth

    user = create(:user)
    create(:google_auth, user: user, uid: ENV['GOOGLE_INDIV_UID'])

    visit login_path
    click_button 'Login with Google'

    expect(GoogleAuth.count).to eq(1)
    expect(User.count).to eq(1)
    
    expect(current_path).to eq(landmarks_path)
    expect(page).to have_content("Welcome, #{user.first_name}!")
    
    expect(page).to have_link('Log Out')
    expect(page).to_not have_link('Login')
    expect(page).to_not have_link('Register')

    OmniAuth.config.mock_auth[:google_oauth2] = nil
  end
end
