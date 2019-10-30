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
