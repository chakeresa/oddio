Given("I'm a visitor") do
  allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(nil)
end

Given("I'm a logged-in regular user") do
  user = create(:user)
  allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
end

Given("I'm a logged-in admin user") do
  admin = create(:admin)
  allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)
end
