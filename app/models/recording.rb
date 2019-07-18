class Recording < ApplicationRecord
  belongs_to :user
  belongs_to :landmark

  validates_presence_of :title
  validates_presence_of :url
end
