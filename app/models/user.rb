class User < ApplicationRecord
  validates :username, uniqueness: { case_sensitive: false }, presence: true
  validates_presence_of :password_digest,
                        :role

  enum role: ['user', 'admin']

  before_save { self.username = username && username.downcase }

  has_secure_password

  def self.create_from_google(auth_hash)
    email = auth_hash["info"]["email"]
    first_name = auth_hash["info"]["first_name"]
    last_name = auth_hash["info"]["last_name"]
    create(email: email, first_name: first_name, last_name: last_name)
  end
end
