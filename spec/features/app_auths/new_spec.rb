require 'rails_helper'

RSpec.describe 'Registering a new user' do
  describe 'as a visitor' do
    before(:each) do
      visit register_path
    end

    it 'loads the page' do
      expect(current_path).to eq(register_path)
      expect(status_code).to eq(200)
    end

    it 'has links to register with Google & Twitter' do
      expect(page).to have_link('Login with Google')
      expect(page).to have_selector(:css, "a[href='/auth/google_oauth2']")
      expect(page).to have_link('Login with Twitter')
      # TODO: expect(page).to have_selector(:css, "a[href=\"#{ ??? }\"]")
    end

    it 'I can register' do
      username = 'BobTheBuilder'
      password = 'supersecurepassword'
      email = 'BobTheBuilder@gmail.com'
      first_name = 'Bob'
      last_name = 'TheBuilder'
      display_name = 'btb42'

      fill_in 'app_auth[username]', with: username
      fill_in 'app_auth[password]', with: password
      fill_in 'app_auth[password_confirmation]', with: password
      click_button('Make an Account')
      
      expect(current_path).to eq(new_user_path)
      expect(AppAuth.count).to eq(1)
      expect(User.count).to eq(0)
      
      fill_in 'user[display_name]', with: display_name
      fill_in 'user[email]', with: email
      fill_in 'user[first_name]', with: first_name
      fill_in 'user[last_name]', with: last_name
      click_button("Let's Get Started")
      
      expect(page).to have_content("Welcome, #{first_name}!")
      expect(page).to have_link('Log Out')
      expect(page).to have_selector(:css, "a[href=\"#{ logout_path }\"]")
      expect(page).to_not have_link('Login')
      expect(page).to_not have_link('Register')
    end

    xit 'I cannot register with a duplicate username (even with different capitalization)' do
      username = 'BobTheBuilder'
      password = 'supersecurepassword'

      create(:user, username: username.downcase)

      fill_in 'user[username]', with: username
      fill_in 'user[password]', with: password
      fill_in 'user[password_confirmation]', with: password
      click_button('Make an Account')

      expect(page).to have_field('user[password_confirmation]')
      expect(User.count).to eq(1)
      
      expect(page).to have_content('Username has already been taken')
      expect(page).to_not have_content("Welcome, #{username.downcase}!")

      expect(page).to_not have_link('Log Out')
      expect(page).to have_link('Login')
      expect(page).to have_link('Register')
    end

    xit "I cannot register if passwords don't match" do
      username = 'BobTheBuilder'
      password = 'supersecurepassword'

      fill_in 'user[username]', with: username
      fill_in 'user[password]', with: password
      fill_in 'user[password_confirmation]', with: 'extra' + password
      click_button('Make an Account')
      
      expect(page).to have_field('user[password_confirmation]')
      expect(User.count).to eq(0)
      
      expect(page).to have_content("Password confirmation doesn't match")
      expect(page).to_not have_content("Welcome, #{username.downcase}!")

      expect(page).to_not have_link('Log Out')
      expect(page).to have_link('Login')
      expect(page).to have_link('Register')
    end

    xit 'I cannot register if I leave username blank' do
      password = 'supersecurepassword'

      fill_in 'user[password]', with: password
      fill_in 'user[password_confirmation]', with: password
      click_button('Make an Account')
      
      expect(page).to have_field('user[password_confirmation]')
      expect(User.count).to eq(0)
      
      expect(page).to have_content("Username can't be blank")
      expect(page).to_not have_content("Welcome, ")

      expect(page).to_not have_link('Log Out')
      expect(page).to have_link('Login')
      expect(page).to have_link('Register')
    end

    xit 'I cannot register if I leave password blank' do
      username = 'BobTheBuilder'

      fill_in 'user[username]', with: username
      click_button('Make an Account')
      
      expect(page).to have_field('user[password_confirmation]')
      expect(User.count).to eq(0)
      
      expect(page).to have_content("Password can't be blank")
      expect(page).to_not have_content("Welcome, #{username.downcase}")

      expect(page).to_not have_link('Log Out')
      expect(page).to have_link('Login')
      expect(page).to have_link('Register')
    end
  end
end
