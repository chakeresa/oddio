require 'rails_helper'

RSpec.describe "Welcome Index" do
  describe 'as a visitor' do
    before(:each) do
      visit '/'
    end

    it 'loads the page' do
      expect(current_path).to eq(root_path)
      expect(status_code).to eq(200)
    end
  end
end
