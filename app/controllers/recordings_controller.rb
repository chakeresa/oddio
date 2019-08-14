class RecordingsController < ApplicationController
  def index
    collection = Recording.all.includes(:user, :landmark)
    @recordings = Recording.sort('recording', collection)
  end
end
