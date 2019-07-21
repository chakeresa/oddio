require 'rails_helper'

RSpec.describe 'Logging out' do
  describe 'as a user with app_auth' do    
    it 'I can log out from any page' do
      password = 'mysecurepassword'
      user = create(:user)
      app_auth = create(:app_auth, user: user, password: password)
  
      visit login_path
  
      fill_in 'username', with: app_auth.username
      fill_in 'password', with: app_auth.password
      click_button('Login')

      click_link('Log Out')

      expect(current_path).to eq(root_path)
      expect(page).to have_content('Logged out. See you next time!')

      expect(page).to_not have_link('Log Out')
      expect(page).to have_link('Register')
      expect(page).to have_link('Register')
    end
  end
  
  describe 'as an admin with app_auth' do    
    it 'I can log out from any page' do
      password = 'mysecurepassword'
      admin = create(:admin)
      app_auth = create(:app_auth, user: admin, password: password)
      
      visit login_path
      
      fill_in 'username', with: app_auth.username
      fill_in 'password', with: app_auth.password
      click_button('Login')

      click_link('Log Out')
      
      expect(current_path).to eq(root_path)
      expect(page).to have_content('Logged out. See you next time!')
      
      expect(page).to_not have_link('Log Out')
      expect(page).to have_link('Register')
      expect(page).to have_link('Register')
    end
  end

  describe 'as a user with google_auth' do
    it 'I can log out from any page' do
      mock_oauth

      user = create(:user)
      create(:google_auth, user: user, uid: ENV['GOOGLE_INDIV_UID'])

      visit login_path
      click_link 'Login with Google'

      click_link('Log Out')
      
      expect(current_path).to eq(root_path)
      expect(page).to have_content('Logged out. See you next time!')
      
      expect(page).to_not have_link('Log Out')
      expect(page).to have_link('Register')
      expect(page).to have_link('Register')

      OmniAuth.config.mock_auth[:google_oauth2] = nil
    end
  end

  describe 'as an admin with google_auth' do
    it 'I can log out from any page' do
      mock_oauth

      admin = create(:admin)
      create(:google_auth, user: admin, uid: ENV['GOOGLE_INDIV_UID'])

      visit login_path
      click_link 'Login with Google'

      click_link('Log Out')
      
      expect(current_path).to eq(root_path)
      expect(page).to have_content('Logged out. See you next time!')
      
      expect(page).to_not have_link('Log Out')
      expect(page).to have_link('Register')
      expect(page).to have_link('Register')

      OmniAuth.config.mock_auth[:google_oauth2] = nil
    end
  end
end
