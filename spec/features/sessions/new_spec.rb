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
      expect(page).to have_link('Login with Google')
      # TODO: expect(page).to have_selector(:css, "a[href=\"#{ ??? }\"]")
      expect(page).to have_link('Login with Twitter')
      # TODO: expect(page).to have_selector(:css, "a[href=\"#{ ??? }\"]")

      fill_in 'username', with: @user.username
      fill_in 'password', with: @password
      click_button('Login')

      expect(current_path).to eq(landmarks_path)

      expect(page).to have_content("Welcome, #{@user.username}!")
      
      expect(page).to have_link('Log Out')
      expect(page).to_not have_link('Login')
      expect(page).to_not have_link('Register')
    end

    it 'will log in with any username case' do
      fill_in 'username', with: @user.username.upcase
      fill_in 'password', with: @password
      click_button('Login')

      expect(current_path).to eq(landmarks_path)
    end

    it "won't log in if username doesn't exist" do
      fill_in 'username', with: @user.username + '1'
      fill_in 'password', with: @password
      click_button('Login')

      expect(page).to have_field('password')

      expect(page).to have_content('Incorrect username/password combination')
      expect(page).to_not have_content("Welcome, #{@user.username}!")
      
      expect(page).to_not have_link('Log Out')
      expect(page).to have_link('Login')
      expect(page).to have_link('Register')
    end

    it "won't log in if password is blank" do
      fill_in 'username', with: @user.username
      click_button('Login')

      expect(page).to have_field('password')

      expect(page).to have_content('Incorrect username/password combination')
      expect(page).to_not have_content("Welcome, #{@user.username}!")
      
      expect(page).to_not have_link('Log Out')
      expect(page).to have_link('Login')
      expect(page).to have_link('Register')
    end

    it "won't log in if username is blank" do
      fill_in 'password', with: @password
      click_button('Login')

      expect(page).to have_field('password')

      expect(page).to have_content('Incorrect username/password combination')
      expect(page).to_not have_content("Welcome, #{@user.username}!")
      
      expect(page).to_not have_link('Log Out')
      expect(page).to have_link('Login')
      expect(page).to have_link('Register')
    end
  end
end
