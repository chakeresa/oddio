class User < ApplicationRecord
  has_many :recordings
  has_one :app_auth
  has_one :google_auth

  validates :email, uniqueness: { case_sensitive: false }, presence: true
  validates :display_name, uniqueness: { case_sensitive: false }, presence: true
  validates_presence_of :first_name
  validates_presence_of :role

  enum role: ['user', 'admin']
end
