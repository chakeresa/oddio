Given("I'm a visitor") do
end

Given("I'm a logged-in regular user") do
  user = create(:user)
  allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
end
