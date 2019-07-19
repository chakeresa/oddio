class Recording < ApplicationRecord
  belongs_to :user

  validates_presence_of :title
  validates_presence_of :url
end
