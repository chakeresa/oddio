require 'rails_helper'

RSpec.describe "Tours Index" do
  describe 'as a visitor' do
    before(:each) do
      visit tours_path
    end

    it 'loads the page' do
      expect(current_path).to eq(tours_path)
      expect(status_code).to eq(200)
    end
  end
end
