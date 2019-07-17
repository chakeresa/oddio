require 'rails_helper'

RSpec.describe 'Registering a new user' do
  describe 'as a visitor' do
    before(:each) do
      visit new_user_path
    end

    it 'loads the page' do
      expect(current_path).to eq(new_user_path)
      expect(status_code).to eq(200)
    end

    it 'I can register' do
      expect(page).to have_link('Login with Google')
      # TODO: expect(page).to have_selector(:css, "a[href=\"#{ ??? }\"]")
      expect(page).to have_link('Login with Twitter')
      # TODO: expect(page).to have_selector(:css, "a[href=\"#{ ??? }\"]")
      
      username = 'bobthebuilder'
      password = 'supersecurepassword'
      fill_in :username, with: username
      fill_in :password, with: password
      fill_in :password_confirmation, with: password
      click_button('Make an Account')
      
      expect(current_path).to eq(landmarks_path)
      
      expect(page).to have_content("Welcome, #{username}!")
      expect(page).to have_link('Log Out')
      expect(page).to have_selector(:css, "a[href=\"#{ logout_path }\"]")
      expect(page).to_not have_link('Login')
      expect(page).to_not have_link('Register')
    end
  end
end
