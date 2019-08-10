require 'rails_helper'

feature 'landmark index' do
  xit 'shows a list of recommended tours' do

    visit landmarks_path

    expect(page).to have_button("Use my Location")

  end

  
end
