require "rails_helper"

describe "navbar search" do

  it "has a search bar on landmarks index page" do
    visit landmarks_path
    within "nav" do
      expect(page).to have_button("Search")
    end
  end

  it "does not on other pages" do
    visit login_path
    within "nav" do
      expect(page).to_not have_button("Search")
    end
  end

end
