Given("a generic landmark") do
  @landmark = create(:landmark)
end

Given("I'm a visitor") do
end

Given("I'm a logged-in regular user") do
  user = create(:user)
  allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
end

When("I visit that landmark's show page") do
  visit landmark_path(@landmark)
end

Then(/I (should not|should) see the (.*) button/) do |should_or_should_not, button_text|
  case should_or_should_not
  when 'should'
    expect(page).to have_button(button_text)
  when 'should not'
    expect(page).to_not have_button(button_text)
  else
    raise "No match for Then statement: use 'should' or 'should not'"
  end
end
