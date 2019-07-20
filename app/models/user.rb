class User < ApplicationRecord
  validates :email, uniqueness: { case_sensitive: false }
  validates_presence_of :role

  enum role: ['user', 'admin']

  def self.create_from_google(auth_hash)
    email = auth_hash["info"]["email"]
    first_name = auth_hash["info"]["first_name"]
    last_name = auth_hash["info"]["last_name"]
    create(email: email, first_name: first_name, last_name: last_name)
  end
end
