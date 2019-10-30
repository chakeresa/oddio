Given("a generic landmark") do
  @landmark = create(:landmark)
end

When("I visit that landmark's show page") do
  visit landmark_path(@landmark)
end
