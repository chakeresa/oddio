class Recording < ApplicationRecord
  belongs_to :user
  belongs_to :landmark

  validates_presence_of :title, :url
end
