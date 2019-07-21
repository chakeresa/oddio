require 'rails_helper'

describe 'visitor sees landmark show' do
  describe 'as a visitor' do
    it "lets me visit a landmarks page" do
      lm1 = create(:landmark)
      visit landmark_path(lm1)
      within ".landmark-name" do
        expect(page).to have_content(lm1.name)
      end
      within ".category" do

        expect(page).to have_content(lm1.category.capitalize)
      end

      within ".attributes" do
        expect(page).to have_content(lm1.phone_number)
        expect(page).to have_content(lm1.address)
      end
    end

  end
end
