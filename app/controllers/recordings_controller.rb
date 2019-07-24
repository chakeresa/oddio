class RecordingsController < ApplicationController
  def index
    @recordings = Recording.all.includes(:user, :landmark)
  end
end
