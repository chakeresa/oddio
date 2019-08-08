class User::BaseController < ApplicationController
  before_action :require_user

  def require_user
    render file: '/public/404', status: 404 unless current_user?
  end
end
