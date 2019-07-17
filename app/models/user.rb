class User < ApplicationRecord
  validates :username, uniqueness: true, presence: true
  validates_presence_of :password_digest,
                        :role

  enum role: ['user', 'admin']

  before_save { self.username = username.downcase }

  has_secure_password
end
