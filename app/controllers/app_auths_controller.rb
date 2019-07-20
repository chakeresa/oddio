class AppAuthsController < ApplicationController
  def new
    @app_auth = AppAuth.new
  end

  def create
  end
end
