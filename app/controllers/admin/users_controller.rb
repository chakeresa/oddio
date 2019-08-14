class Admin::UsersController < Admin::BaseController
  def show
    @user = User.find(params[:user_id])
    # TODO: add different dashboard view for admins -- list of all recordings & tours -- move admin delete buttons out of views/users/show.html.erb to the new view
    render :'/users/show'
  end
end
