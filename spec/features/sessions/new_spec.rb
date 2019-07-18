require 'rails_helper'

RSpec.describe 'Logging in' do
  describe 'as a visitor' do
    before(:each) do
      @password = 'mysecurepassword'
      @user = create(:user, password: @password)
      visit login_path
    end

    it 'loads the page' do
      expect(current_path).to eq(login_path)
      expect(status_code).to eq(200)
    end

    it 'has a form to log in' do
      fill_in 'username', with: @user.username
      fill_in 'password', with: @password
      click_button('Login')

      expect(current_path).to eq(landmarks_path)

      expect(page).to have_content("Welcome, #{@user.username}!")
      
      expect(page).to have_link('Log Out')
      expect(page).to_not have_link('Login')
      expect(page).to_not have_link('Register')
    end
  end
end
