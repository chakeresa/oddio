class User::DashboardController < User::BaseController
  def index
    @user = User.find(current_user.id)
  end
end
