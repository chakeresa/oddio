class GoogleAuth < ApplicationRecord
  belongs_to :user, optional: true

  validates :uid, uniqueness: true, presence: true
  validates_presence_of :token
end
