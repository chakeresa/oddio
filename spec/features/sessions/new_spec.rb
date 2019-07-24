require 'rails_helper'

RSpec.describe 'Logging in' do
  describe 'as a visitor' do
    before(:each) do
      password = 'mysecurepassword'
      @user = create(:user)
      @app_auth = create(:app_auth, user: @user, password: password)
      visit login_path
    end

    it 'loads the page' do
      expect(current_path).to eq(login_path)
      expect(status_code).to eq(200)
    end

<<<<<<< HEAD
    it 'has links to login with Google & Twitter' do
      expect(page).to have_button('Login with Google')
      expect(page).to have_selector(:css, "form[action='/auth/google_oauth2']")
      expect(page).to have_button('Login with Twitter')
      # TODO: expect(page).to have_selector(:css, "form[action=\"#{ ??? }\"]")
=======
    it 'has link a to login with Google' do
      expect(page).to have_button('Login with Google')
      expect(page).to have_selector(:css, "form[action='/auth/google_oauth2']")
>>>>>>> 75b46aee16f8431b4b28d085c1b4ff06652e9983
    end

    it 'has a form to log in' do
      fill_in 'username', with: @app_auth.username
      fill_in 'password', with: @app_auth.password
      click_button('Login')
      
      expect(current_path).to eq(landmarks_path)

      expect(page).to have_content("Welcome, #{@user.first_name}!")
      
      expect(page).to have_link('Log Out')
      expect(page).to_not have_link('Login')
      expect(page).to_not have_link('Register')
    end

    it 'will log in with any username case' do
      fill_in 'username', with: @app_auth.username.upcase
      fill_in 'password', with: @app_auth.password
      click_button('Login')

      expect(current_path).to eq(landmarks_path)
    end

    it "won't log in if username doesn't exist" do
      fill_in 'username', with: @app_auth.username + '1'
      fill_in 'password', with: @app_auth.password
      click_button('Login')

      expect(page).to have_field('password')

      expect(page).to have_content('Incorrect username/password combination')
      expect(page).to_not have_content('Welcome,')
      
      expect(page).to_not have_link('Log Out')
      expect(page).to have_link('Login')
      expect(page).to have_link('Register')
    end

    it "won't log in if password is blank" do
      fill_in 'username', with: @app_auth.username
      click_button('Login')

      expect(page).to have_field('password')

      expect(page).to have_content('Incorrect username/password combination')
      expect(page).to_not have_content('Welcome,')
      
      expect(page).to_not have_link('Log Out')
      expect(page).to have_link('Login')
      expect(page).to have_link('Register')
    end

    it "won't log in if username is blank" do
      fill_in 'password', with: @app_auth.password
      click_button('Login')

      expect(page).to have_field('password')

      expect(page).to have_content('Incorrect username/password combination')
      expect(page).to_not have_content('Welcome,')
      
      expect(page).to_not have_link('Log Out')
      expect(page).to have_link('Login')
      expect(page).to have_link('Register')
    end
  end
end
