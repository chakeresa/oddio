class AppAuth < ApplicationRecord
  belongs_to :user

  validates :username, uniqueness: { case_sensitive: false }, presence: true

  before_save { self.username = username && username.downcase }

  has_secure_password
end
