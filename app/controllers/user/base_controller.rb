class User::BaseController < ApplicationController
  before_action :require_user
end
