class RecordingsController < ApplicationController
  def index
    @recordings = Recording.all
  end
end
