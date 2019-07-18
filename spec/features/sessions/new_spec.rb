require 'rails_helper'

RSpec.describe 'Logging in' do
  describe 'as a visitor' do
    before(:each) do
      @user = create(:user)
      visit login_path
    end

    it 'loads the page' do
      expect(current_path).to eq(login_path)
      expect(status_code).to eq(200)
    end

    xit 'has a form to log in' do
      
    end
  end
end
