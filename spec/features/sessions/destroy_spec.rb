require 'rails_helper'

RSpec.describe 'Logging out' do
  describe 'as a user with app_auth' do
    before(:each) do
      password = 'mysecurepassword'
      user = create(:user)
      app_auth = create(:app_auth, user: user, password: password)

      visit login_path

      fill_in 'username', with: app_auth.username
      fill_in 'password', with: app_auth.password
      click_button('Login')
    end

    it 'I can log out from any page' do
      click_link('Log Out')

      expect(current_path).to eq(root_path)
      expect(page).to have_content('Logged out. See you next time!')

      expect(page).to_not have_link('Log Out')
      expect(page).to have_link('Register')
      expect(page).to have_link('Register')
    end
  end

  describe 'as an admin with app_auth' do
    before(:each) do
      password = 'mysecurepassword'
      admin = create(:admin)
      app_auth = create(:app_auth, user: admin, password: password)

      visit login_path

      fill_in 'username', with: app_auth.username
      fill_in 'password', with: app_auth.password
      click_button('Login')
    end

    it 'I can log out from any page' do
      click_link('Log Out')

      expect(current_path).to eq(root_path)
      expect(page).to have_content('Logged out. See you next time!')

      expect(page).to_not have_link('Log Out')
      expect(page).to have_link('Register')
      expect(page).to have_link('Register')
    end
  end
end
