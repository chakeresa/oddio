require 'rails_helper'

  feature 'recordings index page', :vcr do
  before(:each) do
    @r1, @r2 = create_list(:recording, 2)
  end

  it "has a button to flag content" do
    visit recordings_path(@r1)
    expect(@r1.flags.count).to eq(0)
    click_button("⚑")
    expect(@r1.flags.count).to eq(1)
    click_button("⚑")
    # expect(page).to have_content("Thank you for your re
    expect(@r1.flags.count).to eq(1)
  end

end
